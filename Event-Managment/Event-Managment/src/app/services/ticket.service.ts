import { Injectable } from '@angular/core';   
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TicketAnalytics } from '../Interfaces/ticket-analytics.interface';
import { Ticket } from '../Interfaces/tickets.interface';
import { TicketPurchase } from '../Interfaces/tickets.interface';

@Injectable({
  providedIn: 'root'
})
export class TicketService {

  private baseUrl = 'https://localhost:7096/api/Ticket';

  constructor(private http: HttpClient) { }

  getEventAnalytics(eventId: number): Observable<TicketAnalytics> {
    return this.http.get<TicketAnalytics>(`${this.baseUrl}/events/${eventId}/analytics`);
  }


  private apiUrl = 'https://localhost:7096/api/Ticket';
  getTicketByEventId(eventId: number): Observable<Ticket> {
    return this.http.get<Ticket>(`${this.apiUrl}/event/${eventId}`);
  }

  purchaseTicket(purchaseData: TicketPurchase): Observable<any> {
    return this.http.post(`${this.apiUrl}/purchase`, purchaseData);
  }
}
