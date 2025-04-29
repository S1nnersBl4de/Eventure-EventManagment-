using EventManagment.ENUMS;

namespace EventManagment.models;

public class Users
{
    public int Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; } = string.Empty;
    public string Email { get; set; }
    public string PasswordHash { get; set; }
    public bool IsVerified { get; set; }


    public USER_ROLES? Roles { get; set; }

    public string? RegistrationCode { get; set; }
    public string? VerificationCode { get; set; }
    public DateTime? VerificationExpiresAt { get; set; }
    public USER_STATUS Status { get; set; } = USER_STATUS.Pending;
    public DateTime CreatedAt { get; set; }


}
