import { Component, OnInit } from '@angular/core';
import { EventService } from '../../services/event.service';
import { Event } from '../../Interfaces/event.interface';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  isDropdownOpen = false;
  dropdownHover = false;
  searchText = '';
  searchResults: Event[] = [];
  showDropdown = false;

  userEmail: string | null = null; 
  isUserDropdownOpen = false;      

  constructor(private eventService: EventService) {}

  ngOnInit(): void {
    const userData = localStorage.getItem('user');
    if (userData) {
      const user = JSON.parse(userData);
      this.userEmail = user.email;
    }
  }

  opendropdown() {
    this.isDropdownOpen = true;
  }

  closeDropdown() {
    setTimeout(() => {
      if (!this.dropdownHover) {
        this.isDropdownOpen = false;
      }
    }, 200);
  }

  onDropdownEnter() {
    this.dropdownHover = true;
  }

  onDropdownLeave() {
    this.dropdownHover = false;
    this.closeDropdown();
  }

  onSearchInput() {
    if (this.searchText.trim().length >= 2) {
      this.eventService.searchEvents(this.searchText.trim()).subscribe(
        (results) => {
          this.searchResults = results;
          this.showDropdown = true;
        },
        (error) => {
          console.error('Error during search:', error);
          this.searchResults = [];
          this.showDropdown = false;
        }
      );
    } else {
      this.searchResults = [];
      this.showDropdown = false;
    }
  }

  closeDropDown() {
    this.showDropdown = false;
  }


  openUserDropdown() {
    this.isUserDropdownOpen = true;
  }

  closeUserDropdown() {
    setTimeout(() => {
      this.isUserDropdownOpen = false;
    }, 200);
  }


  logout() {
    localStorage.removeItem('user');
    window.location.href = '/';
  }
}
