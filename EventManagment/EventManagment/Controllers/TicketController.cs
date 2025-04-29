using EventManagment.DTO.TicketDtos;
using EventManagment.Services.Abstractions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EventManagment.Controllers;

[Route("api/[controller]")]
[ApiController]
public class TicketController : ControllerBase
{
    private readonly ITicketEmailService _ticketEmailService;
    private readonly ITicketService _ticketService;
    private readonly IQRCodeService _qrCodeService;
    private readonly ILoggerService _logger;

    public TicketController(
        ITicketEmailService ticketEmailService, ITicketService ticketService, IQRCodeService qrCodeService, ILoggerService logger)
    {
        _ticketEmailService = ticketEmailService;
        _ticketService = ticketService;
        _qrCodeService = qrCodeService;
        _logger = logger;
    }


    //create tickets
    [HttpPost("{eventId}/create")]
    public async Task<IActionResult> CreateTickets(int eventId, List<TicketCreateDto> tickets)
    {
        try
        {
            var success = await _ticketService.CreateTicketsForEventAsync(eventId, tickets);
            return success ? Ok("tickets created!") : BadRequest("ticket creation failed");
        }
        catch (Exception ex)
        {
            _logger.LogError("Error creating tickets", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    //purchase tickets by user
    [HttpPost("purchase")]
    public async Task<IActionResult> PurchaseTicket([FromBody] TicketPurchaseDto ticketDto)
    {

        try
        {
            var ticket = await _ticketService.PurchaseTicketAsync(ticketDto);

            //generating qr
            var qrcontent = $"TicketId: {ticket.Id}, Event: {ticket.EventId}, Category: {ticket.Category}";
            var qrCode = _qrCodeService.GenerateQRCodeBytes(ticket.Id.ToString());

            //send email with qrcode image
            await _ticketEmailService.SendTicketEmailAsync(ticket.BuyerEmail, ticket.Category, qrCode);

            return Ok(ticket);
        }

        catch (Exception ex)
        {
            _logger.LogError("Error purchasing ticket", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    //get tickets by Id
    [HttpGet("{id}")]
    public async Task<IActionResult> GetTicket(int id)
    {
        try
        {
            var ticket = await _ticketService.GetTicketById(id);
            return Ok(ticket);
        }
        catch (Exception ex)
        {
            _logger.LogError($"Error retrieving ticket with ID {id}", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    //get all tickets fon an single event by eventId
    [HttpGet("event/{eventId}")]
    public async Task<IActionResult> GetTicketsByEvent(int eventId)
    {
        try
        {
            var tickets = await _ticketService.GetTicketByTicketByEventIdAsync(eventId);
            return Ok(tickets);
        }
        catch (Exception ex)
        {
            _logger.LogError($"Error retrieving tickets for event ID {eventId}", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    //VALIDATE TICKET (e.g. at entry scan)
    [HttpPost("validate")]
    public async Task<IActionResult> ValidateTicket([FromBody] TicketValidationDto validationDto)
    {
        try
        {
            var isValid = await _ticketService.ValidateTicketAsync(validationDto);
            return Ok(new { Valid = isValid });
        }
        catch (Exception ex)
        {
            _logger.LogError("Error validating ticket", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    [HttpGet("events/{eventId}/analytics")] //ticket analytics
    public async Task<IActionResult> GetEventAnalytics(int eventId)
    {
        try
        {
            var analytics = await _ticketService.GetEventAnalyticsAsync(eventId);
            return Ok(analytics);
        }
        catch (Exception ex)
        {
            _logger.LogError($"Error getting analytics for event ID {eventId}", ex);
            return StatusCode(500, "Internal server error");
        }
    }
}
