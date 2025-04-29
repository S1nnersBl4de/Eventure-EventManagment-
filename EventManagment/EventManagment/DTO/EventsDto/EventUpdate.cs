using EventManagment.ENUMS;
using EventManagment.models;

namespace EventManagment.DTO.EventsDto;

public class EventUpdate
{
    public string Name { get; set; }
    public string Description { get; set; }
    public string StartDateDay { get; set; }
    public string StartDateMonth { get; set; }
    public int StartDateDayNumber { get; set; }
    public string StartDateTime { get; set; }
    public int MaxParticipants { get; set; }
    public EVENT_STATUS Status { get; set; }
    public int? LocationId { get; set; }
    public EVENT_CATEGORY Category { get; set; }
    public string ImageUrl { get; set; } 
}
