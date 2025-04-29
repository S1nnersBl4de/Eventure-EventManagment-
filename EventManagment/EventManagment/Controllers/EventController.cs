using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using EventManagment.Services.Abstractions;
using EventManagment.Services.Implementations;
using EventManagment.DTO.EventsDto;
using Microsoft.AspNetCore.Http.HttpResults;

namespace EventManagment.Controllers;

[Route("api/[controller]")]
[ApiController]
public class EventController : ControllerBase
{
    private readonly IEventService _eventService;
    private readonly ILoggerService _logger;

    public EventController(IEventService eventService, ILoggerService logger)
    {

        _eventService = eventService;
        _logger = logger;
    }



    [HttpGet("GET-ALL-EVENTS")] //1 get all events
    public async Task<ActionResult<IEnumerable<EventResponse>>> GetAllEvents()
    {
        try
        {
            var events = await _eventService.GetAllEventsAsync();
            return Ok(events);
        }
        catch (Exception ex)
        {
            _logger.LogError($"Error getting all events: {ex.Message}", ex);
            return StatusCode(500, "Internal server error");
        }
       
    }

    [HttpGet("GET-EVENT/{id}")] //get event by its id
    public async Task<ActionResult<EventResponse>> GetEventById(int id)
    {
        try
        {
            var eventResponse = await _eventService.GetEventByIdAsync(id);
            return eventResponse != null ? Ok(eventResponse) : NotFound();
        }
        catch (Exception ex)
        {
            _logger.LogError($"Error getting event with ID {id}: {ex.Message}", ex);
            return StatusCode(500, "Internal server error");
        }
    }


    [HttpPost("CREATE-EVENT")] //creating new event 
    public async Task<ActionResult<EventResponse>> CreateEvent([FromBody] EventCreatecs eventDto)
    {
        try
        {
            if (eventDto == null)
            {
                return BadRequest("Event data is required.");

            }
            var newEvent = await _eventService.CreateEventAsync(eventDto);
            return CreatedAtAction(nameof(GetEventById), new { id = newEvent.Id }, newEvent);

        }
        catch(ArgumentException ex)
        {
            return BadRequest(ex.Message);
        }
        catch(Exception ex)
        {
            _logger.LogError($"Error creating event: {ex.Message}", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    [HttpPut("UPDATE-EVENT/{id}")] //can update event by id
    public async Task<IActionResult> UpdateEvent(int id, [FromBody] EventUpdate eventUpdate)
    {
        try
        {
            _logger.LogInfo($"Updating event with ID {id}");
            var isUpdated = await _eventService.UpdateEventAsync(id, eventUpdate);
            return isUpdated ? Ok("Event updated successfully.") : NotFound("Event not found.");
        }
        catch (ArgumentException ex)
        {
            _logger.LogWarning($"Invalid update request for event ID {id}: {ex.Message}");
            return BadRequest(ex.Message);
        }
        catch(Exception ex)
        {
            _logger.LogError($"Failed to update event with ID {id}: {ex.Message}", ex);
            return StatusCode(500, "Internal server error");
        }
    }


    [HttpDelete("DELETE-EVENT/{id}")] //deleting event
    public async Task<IActionResult> DeleteEvent(int id)
    {
        try
        {
            _logger.LogInfo($"Deleting event with ID {id}");
            var isDeleted = await _eventService.DeleteEventAsync(id);
            return isDeleted ? Ok("Event deleted successfully.") : NotFound("Event not found.");
        }
        catch (Exception ex)
        {
            _logger.LogError($"Failed to delete event with ID {id}: {ex.Message}", ex);
            return StatusCode(500, "Internal server error");
        }

        
    }


    [HttpGet("search")] //search for even by name
    public async Task<IActionResult> SearchEvents([FromQuery] string name)
    {
        if (string.IsNullOrEmpty(name))
        {
            return BadRequest("Search term is required.");
        }

        var results = await _eventService.SearchEventsByNameAsync(name);

        if(results == null || !results.Any())
        {
            return NotFound("No events found matching the search term.");
        }
        return Ok(results);
    }
}
