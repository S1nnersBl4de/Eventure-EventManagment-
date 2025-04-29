namespace EventManagment.Services.Abstractions;

public interface IEmailSender
{
    Task SendEmailAsync(string to, string code);
    Task SendAccountApprovalEmailAsync(string to,string code);
    Task SendResetPasswordEmailAsync(string to, string code);

}
