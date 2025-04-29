import { CanActivateFn, Router } from '@angular/router';

export const adminGuard: CanActivateFn = (route, state) => {
  const userData = localStorage.getItem('user');
  const user = userData ? JSON.parse(userData) : null;

  if (user?.role === 0) { // 0 = Admin
    return true;
  } else {
    alert("You don't have permission to access this page.");
    window.location.href = '/';
    return false;
  }
};
