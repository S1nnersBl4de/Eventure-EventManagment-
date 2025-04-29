using EventManagment.DTO.POST;
using EventManagment.models;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using System.Threading.Tasks;




namespace EventManagment.Services.Abstractions;

public interface IUserService
{
    Task<ApiResponse<string>> RegisterUser(RegisterRequest request);
    Task<ApiResponse<string>> VerifyUser(VerifyEmailRequest request);
    Task<ApiResponse<string>> LoginUser(LoginRequest request);
    Task<ApiResponse<string>> RequestPasswordReset(RequestPasswordReset request);
    Task<ApiResponse<string>> ResetPassword(ResetPasswordRequest request);


}
