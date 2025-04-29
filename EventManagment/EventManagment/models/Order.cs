using System.Net.Sockets;
using EventManagment.ENUMS;

namespace EventManagment.models;

public class Order
{
    public int Id { get; set; }
    public int UserId { get; set; }
    public DateTime OrderDate { get; set; } = DateTime.UtcNow;
    public decimal TotalPrice { get; set; }
    public ORDER_STATUS Status { get; set; } = ORDER_STATUS.Pending;
    
    //navigation
    public Users Users { get; set; }
    public List<Tickets> Tickets { get; set; } = new List<Tickets>();

    
}
