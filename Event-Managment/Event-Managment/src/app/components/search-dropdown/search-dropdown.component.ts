import { Component, Input } from '@angular/core';
import { Event } from '../../Interfaces/event.interface';


@Component({
  selector: 'app-search-dropdown',
  templateUrl: './search-dropdown.component.html',
  styleUrl: './search-dropdown.component.css'
})
export class SearchDropdownComponent {

  @Input() events: Event[] = [];

}
