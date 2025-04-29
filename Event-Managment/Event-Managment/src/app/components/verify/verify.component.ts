import { Component } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { VerifyRequest } from '../../Interfaces/authorization.interface';

@Component({
  selector: 'app-verify',
  templateUrl: './verify.component.html',
  styleUrl: './verify.component.css'
})
export class VerifyComponent {

  verifyData: VerifyRequest = {
    email: '',
    verificationCode: ''
  };

  constructor(
    private authService: AuthService,
    private router: Router
  ) {}
   
  onVerify() {
    this.authService.verify(this.verifyData).subscribe({
      next: (response) => {
        console.log('Verification successful:', response);
        alert('Email verified successfully!');
        this.router.navigate(['/authorization']); // 👈 Redirect to Login after success
      },
      error: (error) => {
        console.error('Verification failed:', error);
        alert('Verification failed. Please check the code.');
      }
    });
  }

}
