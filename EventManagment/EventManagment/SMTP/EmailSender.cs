using System.Net;
using System.Net.Mail;
using Microsoft.Extensions.Configuration;
using System.Threading.Tasks;
using EventManagment.Services.Abstractions;


namespace EventManagment.SMTP; //emailsender for authorisation

public class EmailSender : IEmailSender
{
    private readonly string _fromEmail = "lashakakashvili114@gmail.com";
    private readonly string _appPassword = "esbc uwmm jtce jjft";

    public async Task SendEmailAsync(string to, string code)
    {
        var mail = new MailMessage
        {
            From = new MailAddress(_fromEmail),
            Subject = "Your One-Time Code",
            Body = $"Your code is: {code}",
            IsBodyHtml = false
        };

        mail.To.Add(to);

        var smtp = new SmtpClient
        {
            Host = "smtp.gmail.com",
            Port = 587,
            EnableSsl = true,
            Credentials = new NetworkCredential(_fromEmail, _appPassword)
        };

        await smtp.SendMailAsync(mail);
    }

    public async Task SendAccountApprovalEmailAsync(string to, string code)
    {
        var mail = new MailMessage
        {
            From = new MailAddress(_fromEmail),
            Subject = "Your Account Has Been Approved",
            Body = "Congratulations! Your account has been approved. You can now log in.",
            IsBodyHtml = false
        };

        mail.To.Add(to);

        var smtp = new SmtpClient
        {
            Host = "smtp.gmail.com",
            Port = 587,
            EnableSsl = true,
            Credentials = new NetworkCredential(_fromEmail, _appPassword)

        };

        await smtp.SendMailAsync(mail);
    }

    public async Task SendResetPasswordEmailAsync(string to, string code)
    {
        var mail = new MailMessage
        {
            From = new MailAddress(_fromEmail),
            Subject = "Your Password Reset Code",
            Body = $"your reset code is: {code}", 
            IsBodyHtml = false
        };

        mail.To.Add(to);

        var smtp = new SmtpClient
        {
            Host = "smtp.gmail.com",
            Port = 587,
            EnableSsl = true,
            Credentials = new NetworkCredential(_fromEmail, _appPassword)
        };

        await smtp.SendMailAsync(mail);
    }




}
