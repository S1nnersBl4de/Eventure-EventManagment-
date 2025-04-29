namespace EventManagment.DTO.EventsDto;

public class EventAnalyticsDto
{
    public int EventId { get; set; }
    public string EventName { get; set; }
    public int TotalTickets { get; set; }
    public int TicketsSold { get; set; }
    public int AvailableTickets { get; set; }
    public decimal TotalRevenue { get; set; }
    public string MostPopularCategory { get; set; }
    public Dictionary<string, int> PromoCodeUsage { get; set; }
}
