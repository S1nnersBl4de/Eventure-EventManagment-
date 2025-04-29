using EventManagment.DTO.POST;
using EventManagment.Services.Abstractions;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EventManagment.Controllers;

[Route("api/[controller]")]
[ApiController]
public class UserController : ControllerBase
{
    private readonly IUserService _userService;
    private readonly ILoggerService _logger;


    public UserController(IUserService userService, ILoggerService logger)
    {
        _userService = userService;
        _logger = logger;
    }


    [HttpPost("Register")] //register user on website
    public async Task<IActionResult> Register([FromBody] RegisterRequest request)
    {
        try
        {
            var response = await _userService.RegisterUser(request);
            return response.Success ? Ok(response) : BadRequest(response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error during registration", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    [HttpPost("Verify")] //verify user
    public async Task<IActionResult> VerifyEmail([FromBody] VerifyEmailRequest request)
    {
        try
        {
            var response = await _userService.VerifyUser(request);
            return response.Success ? Ok(response) : BadRequest(response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error during email verification", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    [HttpPost("Login")] //login already created user
    public async Task<IActionResult> Login([FromBody] LoginRequest request)
    {
        try
        {
            var response = await _userService.LoginUser(request);
            return response.Success ? Ok(response) : BadRequest(response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error during login", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    [HttpPost("request-password-reset")] //request password reset code on email
    public async Task<IActionResult> RequestPasswordReset([FromBody] RequestPasswordReset request)
    {
        try
        {
            var response = await _userService.RequestPasswordReset(request);
            return response.Success ? Ok(response) : BadRequest(response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error requesting password reset", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    [HttpPost("password-reset")]  //reset password
    public async Task<IActionResult> ResetPaswword([FromBody] ResetPasswordRequest request)
    {
        try
        {
            var response = await _userService.ResetPassword(request);
            return response.Success ? Ok(response) : BadRequest(response);
        }
        catch (Exception ex)
        {
            _logger.LogError("Error resetting password", ex);
            return StatusCode(500, "Internal server error");
        }
    }
}
