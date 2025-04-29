using EventManagment.ENUMS;

namespace EventManagment.DTO.TicketDtos;

public class TicketResponseDto
{
    public int Id { get; set; }
    public int EventId { get; set; }
    public string EventName { get; set; }
    public string Category { get; set; }
    public decimal Price { get; set; }
    public bool IsUsed { get; set; }
    public string BuyerEmail { get; set; }
    public string? PromoCode { get; set; }
    public string? QrCode { get; set; }
}
