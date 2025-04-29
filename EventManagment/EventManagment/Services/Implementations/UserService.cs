using System;
using System.Linq;
using System.Threading.Tasks;
using EventManagment.DTO.POST;
using EventManagment.models;
using EventManagment.Services.Abstractions;
using Microsoft.EntityFrameworkCore;
using EventManagment.Data;
using EventManagment.SMTP;
using EventManagment.ENUMS;


namespace EventManagment.Services.Implementations;

public class UserService : IUserService
{
    private readonly DataContext _Context;
    private readonly IEmailSender _emailSender;

    public UserService(DataContext context, IEmailSender emailSender)
    {
        _Context = context;
        _emailSender = emailSender;
    }

    public async Task<ApiResponse<string>> RegisterUser(RegisterRequest request)
    {
        var userExists = await _Context.Users.AnyAsync(u => u.Email == request.Email);
        if (userExists)
            return new ApiResponse<string>(false, "User already exists");


        // Convert the Role string to the corresponding enum value
        USER_ROLES role = Enum.Parse<USER_ROLES>(request.Role, true); // Assuming valid role is provided

        var newUser = new Users
        {
            FirstName = request.FirstName,
            LastName = request.LastName,
            Email = request.Email,
            PasswordHash = BCrypt.Net.BCrypt.HashPassword(request.Password),
            Roles = Enum.Parse<USER_ROLES>(request.Role, true), 
            VerificationCode = new Random().Next(100000, 1000000).ToString("D6"),
            VerificationExpiresAt = DateTime.UtcNow.AddMinutes(10),
            IsVerified = false,
            RegistrationCode = Guid.NewGuid().ToString()
        }; 

        _Context.Users.Add(newUser);
        await _Context.SaveChangesAsync();

        await _emailSender.SendEmailAsync(newUser.Email, newUser.VerificationCode);

        return new ApiResponse<string>(true, "User registered successfully, please verify your email");
    }


    public async Task<ApiResponse<string>> VerifyUser(VerifyEmailRequest request)
    {
        var user = await _Context.Users.FirstOrDefaultAsync(u => u.Email == request.Email);
        if(user == null)
        {
            return new ApiResponse<string>(false, "user not found");
        }
        if(user.VerificationCode != request.VerificationCode)
        {
            return new ApiResponse<string>(false, "invalid verification code");
        }

        user.IsVerified = true;
        user.VerificationCode = "";
        await _Context.SaveChangesAsync();

        return new ApiResponse<string>(true, "User verified successfully");
    }


    public async Task<ApiResponse<string>> LoginUser(LoginRequest request)
    {
        var user = await _Context.Users.FirstOrDefaultAsync(u => u.Email == request.Email);
        if(user == null || !user.IsVerified)
        {
            return new ApiResponse<string>(false, "Invalid credentials or unverified account");
        }

        bool isPasswordValid = BCrypt.Net.BCrypt.Verify(request.Password, user.PasswordHash);
        if(!isPasswordValid)
        {
            return new ApiResponse<string>(false, "Invalid credentials");
        }

        return new ApiResponse<string>(true, "Login successful");
    }


    public async Task<ApiResponse<string>> RequestPasswordReset(RequestPasswordReset request)
    {
        var user = await _Context.Users.FirstOrDefaultAsync(u => u.Email == request.Email);
        if(user == null)
        {
            return new ApiResponse<string>(false, "User not found");
        }

        user.VerificationCode = new Random().Next(100000, 9999999).ToString();
        await _Context.SaveChangesAsync();

        await _emailSender.SendResetPasswordEmailAsync(user.Email, user.VerificationCode);

        return new ApiResponse<string>(true, "Password reset code sent");

    }


    public async Task<ApiResponse<string>> ResetPassword(ResetPasswordRequest request)
    {
        var user = await _Context.Users.FirstOrDefaultAsync(u => u.Email == request.Email);
        if (user == null)
        {
            return new ApiResponse<string>(false, "user not found");
        }

        if(user.VerificationCode != request.VerificationCode)
        {
            return new ApiResponse<string>(false, "Invalid reset code");
        }

        user.PasswordHash = BCrypt.Net.BCrypt.HashPassword(request.NewPassword);
        user.VerificationCode = "";
        await _Context.SaveChangesAsync();

        return new ApiResponse<string>(true, "Password reset successful");
    }
}
