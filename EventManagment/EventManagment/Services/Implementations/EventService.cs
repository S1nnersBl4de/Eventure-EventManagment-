namespace EventManagment.Services.Implementations;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using EventManagment.ENUMS;
using EventManagment.Data;
using EventManagment.DTO.EventsDto;
using EventManagment.Services.Abstractions;
using EventManagment.models;


public class EventService : IEventService
{
    private readonly DataContext _context;

    public EventService(DataContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<EventResponse>> GetAllEventsAsync() //display all events 
    {
        var events = await _context.Events
         .Include(e => e.Location) 
         .AsNoTracking() // Better performance for read-only    
         .ToListAsync();

        return events.Select(e => new EventResponse
        {
            Id = e.Id,
            Name = e.Name,
            Description = e.Description,
            StartDateDay = e.StartDateDay,
            StartDateMonth = e.StartDateMonth,
            StartDateDayNumber = e.StartDateDayNumber,
            StartDateTime = e.StartDateTime,
            MaxParticipants = e.MaxParticipants,
            OrganizerName = e.OrganizerName,
            Status = e.Status.ToString(),
            Category = e.Category.ToString(),
            ImageUrl = e.ImageUrl,
            Location =  e.Location != null ? new LocationDto
            {
                Id = e.Location.Id,
                City = e.Location.City,
                Address = e.Location.Address,
            } : null,   
        });
    }





    public async Task<EventResponse> CreateEventAsync(EventCreatecs eventDto) //for creating event
    {
       
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            // Handle location (existing or new)
            Location location;
            if (eventDto.ExistingLocationId.HasValue)
            {
                location = await _context.Locations.FindAsync(eventDto.ExistingLocationId.Value);
                if (location == null)
                    throw new ArgumentException("Specified location doesn't exist");
            }
            else if (eventDto.NewLocation != null)
            {
                location = new Location
                {
                    City = eventDto.NewLocation.City,
                    Address = eventDto.NewLocation.Address
                };
                _context.Locations.Add(location);
                await _context.SaveChangesAsync();
            }
            else
            {
                throw new ArgumentException("Either ExistingLocationId or NewLocation must be provided");
            }

            // Create event
            var newEvent = new Event
            {
                Name = eventDto.Name,
                Description = eventDto.Description,
                StartDateDay = eventDto.StartDateDay,
                StartDateMonth = eventDto.StartDateMonth,
                StartDateDayNumber = eventDto.StartDateDayNumber,
                StartDateTime = eventDto.StartDateTime,
                LocationId = location.Id,
                MaxParticipants = eventDto.MaxParticipants,
                OrganizerName = eventDto.OrganizerName,
                Status = Enum.Parse<EVENT_STATUS>(eventDto.Status), // Convert string → enum
                Category = Enum.Parse<EVENT_CATEGORY>(eventDto.Category),
                ImageUrl = eventDto.ImageUrl
            };

            _context.Events.Add(newEvent);
            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new EventResponse
            {
                Id = newEvent.Id,
                Name = newEvent.Name,
                Description = newEvent.Description,
                StartDateDay = newEvent.StartDateDay,
                StartDateMonth = newEvent.StartDateMonth,
                StartDateDayNumber = newEvent.StartDateDayNumber,
                StartDateTime = newEvent.StartDateTime,
                Location = new LocationDto
                {
                    Id = location.Id,
                    City = location.City,
                    Address = location.Address
                },
                MaxParticipants = newEvent.MaxParticipants,
                OrganizerName = newEvent.OrganizerName,
                Status = newEvent.Status.ToString(),
                Category = newEvent.Category.ToString(),
                ImageUrl = newEvent.ImageUrl
            };
        }
        catch
        {
            await transaction.RollbackAsync();
            throw;
        }
    }

    public async Task<bool> UpdateEventAsync(int eventId, EventUpdate eventUpdate) //updating existed event
    {
        var eventToUpdate = await _context.Events
            .Include(e => e.Location)
            .FirstOrDefaultAsync(e => e.Id == eventId);

        if (eventToUpdate == null)
        {
            return false;
        }

        // Update basic fields
        eventToUpdate.Name = eventUpdate.Name ?? eventToUpdate.Name;
        eventToUpdate.Description = eventUpdate.Description ?? eventToUpdate.Description;
        eventToUpdate.StartDateDay = eventUpdate.StartDateDay ?? eventToUpdate.StartDateDay;
        eventToUpdate.StartDateMonth = eventUpdate.StartDateMonth ?? eventToUpdate.StartDateMonth;

        eventToUpdate.StartDateDayNumber = eventUpdate.StartDateDayNumber != 0
       ? eventUpdate.StartDateDayNumber
       : eventToUpdate.StartDateDayNumber;

        eventToUpdate.StartDateTime = eventUpdate.StartDateTime ?? eventToUpdate.StartDateTime;
        eventToUpdate.ImageUrl = eventUpdate.ImageUrl ?? eventToUpdate.ImageUrl;
        eventToUpdate.MaxParticipants = eventUpdate.MaxParticipants;



        if (eventToUpdate.LocationId > 0) // Check LocationId, not Location
        {
            var locationExists = await _context.Locations
                .AnyAsync(I => I.Id == eventUpdate.LocationId);

            if (!locationExists)
            {
                throw new ArgumentException("Specified location doesn't exist");
            }

            eventUpdate.LocationId = eventUpdate.LocationId;
        }

        

        await _context.SaveChangesAsync();
        return true;
    }


    public async Task<EventResponse> GetEventByIdAsync(int eventId) //get single event by id
    {
        var eventEntity = await _context.Events
        .Include(e => e.Location) // Include location details
        .AsNoTracking()
        .FirstOrDefaultAsync(e => e.Id == eventId);

        if (eventEntity == null)
            throw new KeyNotFoundException("Event not found");

        return new EventResponse
        {
            Id = eventEntity.Id,
            Name = eventEntity.Name,
            Description = eventEntity.Description,
            StartDateDay = eventEntity.StartDateDay,
            StartDateMonth = eventEntity.StartDateMonth,
            StartDateDayNumber = eventEntity.StartDateDayNumber,
            StartDateTime = eventEntity.StartDateTime,
            MaxParticipants = eventEntity.MaxParticipants,
            OrganizerName = eventEntity.OrganizerName,
            Status = eventEntity.Status.ToString(),
            Category = eventEntity.Category.ToString(),
            ImageUrl = eventEntity.ImageUrl,
            Location = eventEntity.Location != null ? new LocationDto
            {
                Id = eventEntity.Location.Id,
                City = eventEntity.Location.City,
                Address = eventEntity.Location.Address
            } : null
        };
    }


    public async Task<bool> DeleteEventAsync(int eventId) //delete event
    {
        var eventToDelete = await _context.Events.FindAsync(eventId);

        if (eventToDelete == null)
        {
            return false; //event not found
        }

        _context.Events.Remove(eventToDelete);
        await _context.SaveChangesAsync();

        return true;
    }


    public async Task<List<Event>> SearchEventsByNameAsync(string name) //search for event by name
    {
        return await _context.Events
        .Where(e => e.Name.ToLower().Contains(name.ToLower()))
        .ToListAsync();
    }
}
