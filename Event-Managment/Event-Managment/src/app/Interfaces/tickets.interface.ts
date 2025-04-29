export interface Ticket {
  id: number;
  eventId: number;
  price: number;
  category: string;
  isUsed: boolean;
  buyerEmail?: string;
  promoCode?: string;
  qrCode?: string;
}
 
export interface TicketPurchase {
  eventId: number;
  category: string;
  buyerEmail: string;
  promoCode: string;
}