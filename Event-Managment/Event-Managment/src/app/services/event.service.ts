import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Event } from '../Interfaces/event.interface';

@Injectable({
  providedIn: 'root'
})
export class EventService {

  private apiUrl = 'https://localhost:7096/api/Event/GET-ALL-EVENTS';

  constructor(private http: HttpClient) { }

  getAllEvents(): Observable<Event[]> {
    return this.http.get<Event[]>(this.apiUrl);
  }

  searchEvents(name: string) {
    return this.http.get<Event[]>(`https://localhost:7096/api/Event/search?name=${name}`);
  }

  private baseUrl = 'https://localhost:7096/api/Event';

  getEventById(id: number): Observable<Event> {
    return this.http.get<Event>(`${this.baseUrl}/GET-EVENT/${id}`);
  }
}
