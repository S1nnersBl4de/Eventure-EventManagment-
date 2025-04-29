using EventManagment.ENUMS;
using System.ComponentModel.DataAnnotations;

namespace EventManagment.models;

public class Tickets
{
    public int Id { get; set; } // Primary Key (Ticket ID)
    public int EventId { get; set; } // Foreign Key (Event ID)
    public string Category { get; set; }
    public decimal Price { get; set; }
    public string? PromoCode { get; set; }
    public bool IsUsed { get; set; }
    public string? BuyerEmail { get; set; }
    public string? QrCode { get; set; } // Base64 QR code string
    public Event? Event { get; set; }


}
