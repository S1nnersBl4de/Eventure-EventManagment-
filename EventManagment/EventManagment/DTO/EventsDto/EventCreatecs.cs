using EventManagment.ENUMS;
using EventManagment.models;

namespace EventManagment.DTO.EventsDto;

public class EventCreatecs // for post requests
{
    public string Name { get; set; }
    public string Description { get; set; }
    public string StartDateDay { get; set; }
    public string StartDateMonth { get; set; }
    public int StartDateDayNumber { get; set; }
    public string StartDateTime { get; set; }
    public LocationCreateDto? NewLocation { get; set; }  // For NEW locations
    public int? ExistingLocationId { get; set; }         // For EXISTING locations
    public int MaxParticipants { get; set; }
    public string OrganizerName { get; set; }
    public string Status { get; set; } 
    public string Category { get; set; } 
    public string ImageUrl { get; set; } 
}
