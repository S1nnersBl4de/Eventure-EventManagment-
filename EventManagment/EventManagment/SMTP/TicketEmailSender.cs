using EventManagment.Services.Abstractions;
using System.Net;
using System.Net.Mail;
using Microsoft.Extensions.Configuration;
using System.Threading.Tasks;

namespace EventManagment.SMTP;

public class TicketEmailSender : ITicketEmailService //email sender for confirmation message on email
{
    private readonly string _fromEmail = "lashakakashvili114@gmail.com";
    private readonly string _appPassword = "esbc uwmm jtce jjft"; 


    public async Task SendTicketEmailAsync(string to, string eventName, byte[] qrCodeBytes)
    {
        var mail = new MailMessage
        {
            From = new MailAddress(_fromEmail),
            Subject = $"Your Ticket for {eventName}",
            Body = $"Thank you for purchasing a ticket for {eventName}. Your QR code is attached.",
            IsBodyHtml = false
        };

        mail.To.Add(to);

        // Attach the QR code image as PNG
        var attachment = new Attachment(new MemoryStream(qrCodeBytes), "ticket-qrcode.png", "image/png");
        mail.Attachments.Add(attachment);

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
