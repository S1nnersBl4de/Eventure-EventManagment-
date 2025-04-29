import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LayoutComponent } from './components/layout/layout.component';
import { HomePageComponent } from './components/home-page/home-page.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { UthorizationComponent } from './components/uthorization/uthorization.component';
import { register } from 'module';
import { ForgotPasswordComponent } from './components/forgot-password/forgot-password.component';
import { ResetPasswordComponent } from './components/reset-password/reset-password.component';
import { VerifyComponent } from './components/verify/verify.component';
import { ConcertmusicComponent } from './components/concertmusic/concertmusic.component';
import { FestivalsComponent } from './components/festivals/festivals.component';
import { TheatresComponent } from './components/theatres/theatres.component';
import { AboutComponent } from './components/about/about.component';
import { EventdetailComponent } from './components/eventdetail/eventdetail.component';
import { adminGuard } from './guards/admin.guard';
import { DashboardComponent } from './components/dashboard/dashboard.component';

const routes: Routes = [
  {
    path: '',
    component: LayoutComponent,
    children: [
      {
        path: '',
        component: HomePageComponent
      },
      {
        path: 'login',
        component: UthorizationComponent
      },
      {
        path: 'register',
        component: RegisterComponent
      },
      {
        path: 'forgot-password',
        component: ForgotPasswordComponent
      },
      {
        path: 'reset-password',
        component: ResetPasswordComponent
      },
      {
        path: 'verify',
        component: VerifyComponent
      },
      {
        path: 'concerts',
        component: ConcertmusicComponent
      },
      {
        path: 'festivals',
        component: FestivalsComponent
      },
      {
        path: 'theatres',
        component: TheatresComponent
      },
      {
        path: 'about',
        component: AboutComponent
      },
      {
        path: 'event/:id',
        component: EventdetailComponent
      },
      {
        path: 'dashboard',
        component: DashboardComponent,
        canActivate: [adminGuard]
      },
      {
        path: '**',
        redirectTo: ''
      },
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
