using EventManagment.DTO.POST;
using FluentValidation;


namespace EventManagment.Validators;

public class RegisterValidator : AbstractValidator<RegisterRequest>
{
    public RegisterValidator()
    {
        RuleFor(x => x.FirstName)
            .NotEmpty().WithMessage("first name is required")
            .MinimumLength(2).WithMessage("First name must be at least 2 characters");
        RuleFor(x => x.LastName)
                .NotEmpty().WithMessage("Last name is required")
                .MinimumLength(2).WithMessage("Last name must be at least 2 characters");
        RuleFor(x => x.Email)
                .NotEmpty().WithMessage("Email is required")
                .EmailAddress().WithMessage("Invalid email format");
        RuleFor(x => x.Password)
                .NotEmpty().WithMessage("Password is required")
                .MinimumLength(6).WithMessage("Password must be at least 6 characters")
                .Matches(@"^(?=.*[A-Za-z])(?=.*\d).+$").WithMessage("Password must contain letters and numbers");
    }
}
