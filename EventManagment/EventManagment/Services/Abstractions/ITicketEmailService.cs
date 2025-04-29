namespace EventManagment.Services.Abstractions;

public interface ITicketEmailService
{
    Task SendTicketEmailAsync(string to, string eventName, byte[] qrCodeBytes);
}
