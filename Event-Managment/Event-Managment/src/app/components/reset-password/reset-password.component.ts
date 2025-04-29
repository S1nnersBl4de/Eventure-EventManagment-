import { Component } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { Router } from '@angular/router';
import { ResetPasswordRequest } from '../../Interfaces/authorization.interface';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrl: './reset-password.component.css'
})
export class ResetPasswordComponent {
  resetData: ResetPasswordRequest = {
    email: '',
    verificationCode: '',
    newPassword: '',
    confirmNewPassword: ''
  };

  constructor(
    private authService: AuthService,
    private router: Router
  ) {}

  onResetPassword() {
    this.authService.resetPassword(this.resetData).subscribe({
      next: (response) => {
        console.log('Password reset successful:', response);
        alert('Password has been reset successfully!');
        this.router.navigate(['/authorization']); 
      },
      error: (error) => {
        console.error('Password reset failed:', error);
        alert('Something went wrong. Check the code and try again.');
      }
    });
  }

}
