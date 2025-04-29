namespace EventManagment.Services.Abstractions;

public interface IQRCodeService
{
    byte[] GenerateQRCodeBytes(string content);
}
