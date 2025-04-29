export interface TicketAnalytics {
  eventId: number;
  eventName: string;
  totalTickets: number;
  ticketsSold: number;
  availableTickets: number;
  totalRevenue: number;
  mostPopularCategory: string;
  promoCodeUsage: any;
}