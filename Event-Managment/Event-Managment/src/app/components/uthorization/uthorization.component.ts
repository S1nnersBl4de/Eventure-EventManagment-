import { Component } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { Router } from '@angular/router';
import { LoginRequest } from '../../Interfaces/authorization.interface';
@Component({
  selector: 'app-uthorization',
  templateUrl: './uthorization.component.html',
  styleUrl: './uthorization.component.css'
})
export class UthorizationComponent {

   loginData: LoginRequest = {
    email: '',
    password: ''
  };

  constructor(
    private authService: AuthService,
    private router: Router
  ) {}
  

  onLogin() {
    this.authService.login(this.loginData).subscribe({
      next: (response) => {
                                             
        const isAdmin = this.loginData.email === 'lashatinikashvili29@gmail.com'; //forcing admin account to localstorage
  
        const userData = {
          email: this.loginData.email,
          role: isAdmin ? 0 : 1 
        };
  
        localStorage.setItem('user', JSON.stringify(userData));
  
        this.router.navigate(['/']);
      },
      error: (error) => {
        console.error('Login failed:', error);
        alert('Invalid credentials. Please try again.');
      }
    });
  }
  
  

}
