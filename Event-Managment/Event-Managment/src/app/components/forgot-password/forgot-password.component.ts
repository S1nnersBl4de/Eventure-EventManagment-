import { Component } from '@angular/core';
import {Router} from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-forgot-password',
  templateUrl: './forgot-password.component.html',
  styleUrl: './forgot-password.component.css'
})
export class ForgotPasswordComponent {
  email: string = '';

  constructor(
    private authService: AuthService,
    private router: Router
  ) {}


  onRequestReset() {
    this.authService.requestPasswordReset({ email: this.email }).subscribe({
      next: (response) => {
        console.log('Request reset successful:', response);
        alert('Password reset code sent to your email!');
        this.router.navigate(['/reset-password']); 
      },
      error: (error) => {
        console.error('Request reset failed:', error);
        alert('Something went wrong. Try again.');
      }
    });
  }



}
