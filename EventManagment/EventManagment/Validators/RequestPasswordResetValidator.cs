using EventManagment.DTO.POST;
using FluentValidation;


namespace EventManagment.Validators;

public class RequestPasswordResetValidator : AbstractValidator<RequestPasswordReset>
{
    public RequestPasswordResetValidator()
    {
        RuleFor(x => x.Email)
            .NotEmpty().WithMessage("Email is required.")
            .EmailAddress().WithMessage("Invalid email format.");
    }
}
