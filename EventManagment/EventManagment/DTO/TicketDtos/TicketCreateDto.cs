using EventManagment.ENUMS;

namespace EventManagment.DTO.TicketDtos;

public class TicketCreateDto
{
    public int EventId { get; set; }
    public string Category { get; set; }
    public string? PromoCode { get; set; }
    public decimal Price { get; set; }


}
