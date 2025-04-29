namespace EventManagment.DTO.TicketDtos;

public class TicketPurchaseDto
{
    public int EventId { get; set; }
    public string Category { get; set; }
    public string BuyerEmail { get; set; }
    public string? PromoCode { get; set; }
}
