using EventManagment.Services.Abstractions;

namespace EventManagment.Services.Implementations;

public class LoggerService : ILoggerService
{
    private readonly string _logpath;

    public LoggerService(string logpath = "log.txt")
    {
        _logpath = logpath;
    }


    public void LogError(string message, Exception ex)
    {
        string formattedMessage = $"[ERROR] [{DateTime.Now:yyyy-MM-dd HH:mm:ss}] - {message}";
        using (StreamWriter writer = new StreamWriter(_logpath, true))
        {
            writer.WriteLine(formattedMessage);
        }
    }

    public void LogInfo(string message)
    {
        string formattedMessage = $"[INFO] [{DateTime.Now:yyyy-MM-dd HH:mm:ss}] - {message}";
        using (StreamWriter writer = new StreamWriter(_logpath, true))
        {
            writer .WriteLine(formattedMessage);   
        }
    }

    public void LogWarning(string message)
    {
        string formattedMessage = $"[WARNING] [{DateTime.Now:yyyy-MM-dd HH:mm:ss}] - {message}";
        using (StreamWriter writer = new StreamWriter(_logpath, true))
        {
            writer.WriteLine(formattedMessage);
        }
    }
}
