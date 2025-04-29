import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {  RegisterRequest,
         VerifyRequest,
         LoginRequest,
         RequestPasswordResetRequest,
         ResetPasswordRequest } from '../Interfaces/authorization.interface';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private apiUrl = 'https://localhost:7096/api/User';

  constructor(private http: HttpClient) { }

  register(userData: RegisterRequest): Observable<any> {
    return this.http.post(`${this.apiUrl}/Register`, userData);
  }


  verify(verificationData: VerifyRequest): Observable<any> {
    return this.http.post(`${this.apiUrl}/Verify`, verificationData);
  }

  login(loginData: LoginRequest): Observable<any> {
    return this.http.post(`${this.apiUrl}/Login`, loginData);
  }

  requestPasswordReset(emailData: RequestPasswordResetRequest): Observable<any> {
    return this.http.post(`${this.apiUrl}/request-password-reset`, emailData);
  }

  resetPassword(resetData: ResetPasswordRequest): Observable<any> {
    return this.http.post(`${this.apiUrl}/password-reset`, resetData);
  }
}
