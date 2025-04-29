import { Component, OnInit } from '@angular/core';
import { EventService } from '../../services/event.service';
import { Event } from '../../Interfaces/event.interface';

@Component({
  selector: 'app-theatres',
  templateUrl: './theatres.component.html',
  styleUrl: './theatres.component.css'
})
export class TheatresComponent {

  events: Event[] = [];
  randomTicketPrice: number = 0;

  constructor(private eventService: EventService) {}

  ngOnInit(): void {
    this.eventService.getAllEvents().subscribe({
      next: (data) => {
        this.events = data.filter(event => event.category === 'Theatre');
        this.randomTicketPrice = Math.floor(Math.random() * (300 - 20 + 1)) + 20;
      },
      error: (error) => {
        console.error('Error fetching concerts:', error);
      }
    });
  }

}
