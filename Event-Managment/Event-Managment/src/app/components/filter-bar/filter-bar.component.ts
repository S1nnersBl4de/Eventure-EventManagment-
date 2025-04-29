import { Component, output } from '@angular/core';
import { EventEmitter } from '@angular/core';
import { Output } from '@angular/core';
import { Event } from '../../Interfaces/event.interface';
@Component({
  selector: 'app-filter-bar',
  templateUrl: './filter-bar.component.html',
  styleUrl: './filter-bar.component.css'
})
export class FilterBarComponent {

  @Output() categorySelected: EventEmitter<string> = new EventEmitter<string>();

  selectCategory(category: string) {
    this.categorySelected.emit(category);
  }

}
