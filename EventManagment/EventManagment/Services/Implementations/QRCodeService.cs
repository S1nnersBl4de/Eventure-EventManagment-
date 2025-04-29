using EventManagment.Services.Abstractions;
using QRCoder;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;



namespace EventManagment.Services.Implementations;

public class QRCodeService : IQRCodeService
{
    public byte[] GenerateQRCodeBytes(string content)
    {
        using var qrGenerator = new QRCodeGenerator();
        using var QRCodeData = qrGenerator.CreateQrCode(content, QRCodeGenerator.ECCLevel.Q);
        using var qrCode = new QRCode(QRCodeData);
        using var bitmap = qrCode.GetGraphic(20);

        using var stream = new MemoryStream();
        bitmap.Save(stream, ImageFormat.Png);
        
        return stream.ToArray();
    }
}
