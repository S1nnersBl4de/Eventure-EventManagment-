using EventManagment.DTO.EventsDto;
using EventManagment.models;

namespace EventManagment.Services.Abstractions;

public interface IEventService
{
    Task<IEnumerable<EventResponse>> GetAllEventsAsync();
    Task<EventResponse> CreateEventAsync(EventCreatecs eventDto);
    Task<bool> UpdateEventAsync(int eventId, EventUpdate eventUpdate);
    Task<EventResponse> GetEventByIdAsync(int eventId);
    Task<bool> DeleteEventAsync(int eventId);
    Task<List<Event>> SearchEventsByNameAsync(string name);
}
