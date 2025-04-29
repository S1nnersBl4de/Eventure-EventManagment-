import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LayoutComponent } from './components/layout/layout.component';
import { HomePageComponent } from './components/home-page/home-page.component';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { RegisterComponent } from './components/register/register.component';
import { LoginComponent } from './components/login/login.component';
import { FilterBarComponent } from './components/filter-bar/filter-bar.component';
import { EventgridComponent } from './components/eventgrid/eventgrid.component';
import { NZ_I18N } from 'ng-zorro-antd/i18n';
import { ta_IN } from 'ng-zorro-antd/i18n';
import { registerLocaleData } from '@angular/common';
import ta from '@angular/common/locales/ta';
import { FormsModule } from '@angular/forms';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { HttpClient, provideHttpClient } from '@angular/common/http';
import { HttpClientModule } from '@angular/common/http';
import { NzPaginationModule } from 'ng-zorro-antd/pagination';
import { SearchDropdownComponent } from './components/search-dropdown/search-dropdown.component';
import { UthorizationComponent } from './components/uthorization/uthorization.component';
import { VerifyComponent } from './components/verify/verify.component';
import { ForgotPasswordComponent } from './components/forgot-password/forgot-password.component';
import { ResetPasswordComponent } from './components/reset-password/reset-password.component';
import { ConcertmusicComponent } from './components/concertmusic/concertmusic.component';
import { FestivalsComponent } from './components/festivals/festivals.component';
import { TheatresComponent } from './components/theatres/theatres.component';
import { AboutComponent } from './components/about/about.component';
import { EventdetailComponent } from './components/eventdetail/eventdetail.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';


registerLocaleData(ta);

@NgModule({
  declarations: [
    AppComponent,
    LayoutComponent,
    HomePageComponent,
    HeaderComponent,
    FooterComponent,
    RegisterComponent,
    LoginComponent,
    FilterBarComponent,
    EventgridComponent,
    SearchDropdownComponent,
    UthorizationComponent,
    VerifyComponent,
    ForgotPasswordComponent,
    ResetPasswordComponent,
    ConcertmusicComponent,
    FestivalsComponent,
    TheatresComponent,
    AboutComponent,
    EventdetailComponent,
    DashboardComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    NzPaginationModule

  ],
  providers: [
    provideClientHydration(),
    { provide: NZ_I18N, useValue: ta_IN },
    provideAnimationsAsync(),
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
