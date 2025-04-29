using EventManagment.ENUMS;
using EventManagment.DTO.EventsDto;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace EventManagment.models;


public class Event
{
    [Key]  // Marks it as a primary key
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)] 
    public int Id { get; set; }
    public string Name { get; set; }
    [Column(TypeName = "nvarchar(MAX)")] // maxing limitation for description symbols
    public string Description { get; set; }
    public string StartDateDay { get; set; }  
    public string StartDateMonth { get; set; }  
    public int StartDateDayNumber { get; set; }
    public string StartDateTime { get; set; }  
    public int LocationId { get; set; }  
    public Location Location { get; set; } //  Correct EF Relationship
    public int MaxParticipants { get; set; }
    public string OrganizerName { get; set; } 
    public EVENT_STATUS Status { get; set; }
    public EVENT_CATEGORY Category { get; set; }
    public string ImageUrl { get; set; }
    public List<Tickets> Tickets { get; set; } // Navigation Property (One Event -> Many Tickets)


}
