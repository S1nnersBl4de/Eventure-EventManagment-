import { Component } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { Router } from '@angular/router';
import { RegisterRequest } from '../../Interfaces/authorization.interface';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent {

  registerData: RegisterRequest = {
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    confirmPassword: '',
    role: 'Users'
  };

  constructor(
    private authservice: AuthService, 
    private router: Router
  ) {}


  onRegister() {
    if (this.registerData.password !== this.registerData.confirmPassword) {
      alert('Passwords do not match!');
      return;
    }

    this.authservice.register(this.registerData).subscribe({
      next: (response) => {
        console.log('Registration successful:', response);
        alert('Registration successful! Please verify your email.');
        this.router.navigate(['/verify']);
      },
      error: (error) => {
        console.error('Registration failed:', error);
        alert('Registration failed. Please check your data.');
      }
    });
  }

}
