import { Component } from '@angular/core';
import { TicketService } from '../../services/ticket.service';
import { TicketAnalytics } from '../../Interfaces/ticket-analytics.interface';
import { EventService } from '../../services/event.service';
import { Event } from '../../Interfaces/event.interface';
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css'
})
export class DashboardComponent {

  searchText: string = '';
  searchResults: Event[] = [];
  analytics: TicketAnalytics | null = null;

  constructor(
    private ticketService: TicketService,
    private eventService: EventService
  ) {}

  onSearchInput() {
    if (this.searchText.trim().length >= 2) {
      this.eventService.searchEvents(this.searchText).subscribe({
        next: (events) => {
          this.searchResults = events;
        },
        error: () => {
          this.searchResults = [];
        }
      });
    } else {
      this.searchResults = [];
    }
  }

  fetchAnalyticsById(eventId: number) {
    this.ticketService.getEventAnalytics(eventId).subscribe({
      next: (data) => {
        this.analytics = data;
      },
      error: () => {
        alert('Failed to fetch analytics.');
      }
    });
  }

}
