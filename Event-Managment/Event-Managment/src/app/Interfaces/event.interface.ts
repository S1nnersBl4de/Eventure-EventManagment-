export interface Location {
  city: string;
  address: string;
}

export interface Event {
  id: number;
  name: string;
  description: string;
  location: Location;  
  startDateDay: string;
  startDateMonth: string;
  startDateDayNumber: number;
  startDateTime: string;
  maxParticipants: number;
  organizerName: string;
  status: string;
  category: string;
  imageUrl: string;
}