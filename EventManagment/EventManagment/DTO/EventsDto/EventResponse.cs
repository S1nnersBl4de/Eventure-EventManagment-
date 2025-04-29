using EventManagment.ENUMS;
using EventManagment.models;
using System.ComponentModel.DataAnnotations.Schema;
namespace EventManagment.DTO.EventsDto;

public class EventResponse // used in get request
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public string StartDateDay { get; set; }  
    public string StartDateMonth { get; set; }  
    public int StartDateDayNumber { get; set; }
    public string StartDateTime { get; set; } 
    public LocationDto Location { get; set; }
    public int MaxParticipants { get; set; }
    public string OrganizerName { get; set; }
    public string Status { get; set; } 
    public string Category { get; set; } 
    public string ImageUrl { get; set; }
}
