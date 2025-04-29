import { Component, OnInit } from '@angular/core';
import { EventService } from '../../services/event.service';
import { Event } from '../../Interfaces/event.interface';

@Component({
  selector: 'app-eventgrid',
  templateUrl: './eventgrid.component.html',
  styleUrl: './eventgrid.component.css'
})
export class EventgridComponent implements OnInit {

  events: Event[] = [];
  filteredEvents: Event[] = [];
  currentPage = 1;
  pagesize = 8;
  randomTicketPrice: number = 0;

  constructor(private eventservice: EventService) { }

  ngOnInit(): void {
    this.eventservice.getAllEvents().subscribe({
      next: (data) => {
        this.events = data;
        this.filteredEvents = data; 
        this.randomTicketPrice = Math.floor(Math.random() * (300 - 20 + 1)) + 20;
      },
      error: (error) => {
        console.error('Error fetching events:', error);
      }
    })
  }

  get pagedEvents(): Event[] {
    const start = (this.currentPage - 1) * this.pagesize;
    const end = start + this.pagesize;
    return this.filteredEvents.slice(start, end); 
  }

  onPageChange(page: number): void {
    this.currentPage = page;
  }

  filteredByCategory(category: string): void {
    if (category === 'All') {
      this.filteredEvents = this.events;
    } else {
      this.filteredEvents = this.events.filter(event => event.category === category);
    }
    this.currentPage = 1; 
  }
}
