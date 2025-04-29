import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { EventService } from '../../services/event.service';
import { TicketService } from '../../services/ticket.service';
import { Event } from '../../Interfaces/event.interface';
import { Ticket } from '../../Interfaces/tickets.interface';
import { TicketPurchase } from '../../Interfaces/tickets.interface';

@Component({
  selector: 'app-eventdetail',
  templateUrl: './eventdetail.component.html',
  styleUrls: ['./eventdetail.component.css']
})
export class EventdetailComponent implements OnInit {
  event?: Event;
  ticket?: Ticket;

  showPurchasePopup: boolean = false;
  buyerEmail: string = '';
  promoCode: string = '';

  randomTicketPrice: number = 0;

  constructor(
    private route: ActivatedRoute,
    private eventService: EventService,
    private ticketService: TicketService
  ) {}

  ngOnInit(): void {
    const eventId = Number(this.route.snapshot.paramMap.get('id'));

    this.fetchEvent(eventId);
    this.fetchTicket(eventId);

 
    this.randomTicketPrice = Math.floor(Math.random() * (300 - 20 + 1)) + 20;
  }

  fetchEvent(eventId: number): void {
    this.eventService.getEventById(eventId).subscribe({
      next: (event) => (this.event = event),
      error: (err) => console.error('Event error:', err)
    });
  }

  fetchTicket(eventId: number): void {
    this.ticketService.getTicketByEventId(eventId).subscribe({
      next: (ticket) => (this.ticket = ticket),
      error: (err) => console.error('Ticket error:', err)
    });
  }

  submitPurchase(): void {
    if (!this.buyerEmail) {
      alert('Please enter your email');
      return;
    }

    const purchaseData: TicketPurchase = {
      eventId: this.event?.id ?? 0,
      category: this.ticket?.category ?? 'Standard',
      buyerEmail: this.buyerEmail,
      promoCode: this.promoCode
    };

    this.ticketService.purchaseTicket(purchaseData).subscribe({
      next: () => {
        alert('✅ Ticket purchased! Check your email for confirmation.');
        this.showPurchasePopup = false;
        this.buyerEmail = '';
        this.promoCode = '';
      },
      error: (err) => {
        console.error('Purchase error:', err);
        alert('❌ Failed to purchase ticket. Try again.');
      }
    });
  }
}
