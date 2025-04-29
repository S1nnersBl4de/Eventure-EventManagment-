namespace EventManagment.DTO.POST;

public class VerifyEmailRequest
{
    public string Email { get; set; }
    public string VerificationCode { get; set; }
}
