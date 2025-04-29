using EventManagment.Data;
using EventManagment.models;
using EventManagment.DTO.TicketDtos;
using EventManagment.Services.Abstractions;
using Microsoft.EntityFrameworkCore;
using EventManagment.ENUMS;
using EventManagment.DTO.EventsDto;

namespace EventManagment.Services.Implementations;

public class TicketService : ITicketService
{
    private readonly DataContext _context;

    public TicketService (DataContext context)
    {
      _context = context;
    }

    public async Task<bool> CreateTicketsForEventAsync(int eventId, List<TicketCreateDto> tickets) // Create multiple tickets for an event
    {
        var evenExists = await _context.Events.AnyAsync(e => e.Id == eventId);

        if (!evenExists)
        {
            throw new ArgumentException("Event not found!");
        }

        var newTickets = tickets.Select(t => new Tickets
        {
            EventId = eventId,
            Category = t.Category,
            Price = t.Price,
            PromoCode = t.PromoCode,
            IsUsed = false,
        }).ToList();

        await _context.Tickets.AddRangeAsync(newTickets);
        await _context.SaveChangesAsync();
        return true;
    }


    public async Task<TicketResponseDto> PurchaseTicketAsync(TicketPurchaseDto ticketDto) // Purchase a ticket and get confirmation message on gmail
    {
        

        var eventInfo = await _context.Events
       .Where(e => e.Id == ticketDto.EventId)
       .Select(e => new { e.Name }) 
       .FirstOrDefaultAsync();
        
        if (eventInfo == null)
            throw new ArgumentException("Event not found!");

        var ticket = new Tickets
        {
            EventId = ticketDto.EventId,
            Category = ticketDto.Category,
            PromoCode = ticketDto.PromoCode,
            BuyerEmail = ticketDto.BuyerEmail,
            IsUsed = false
        };
        _context.Tickets.Add(ticket);
        await _context.SaveChangesAsync();

        

        return new TicketResponseDto
        {
            Id = ticket.Id,
            EventId = ticket.EventId,
            EventName = eventInfo.Name,
            Category = ticket.Category.ToString(),
            Price = ticket.Price,
            PromoCode = ticket.PromoCode,
            BuyerEmail = ticket.BuyerEmail
        };
    }


    public async Task<TicketResponseDto> GetTicketById(int ticketId) // get ticket by id
    {
        var ticket = await _context.Tickets
            .Include(t => t.Event)
            .FirstOrDefaultAsync(t => t.Id == ticketId);

        if (ticket == null)
        {
            throw new KeyNotFoundException("Ticket not found!");
        }

        return new TicketResponseDto
        {
            Id = ticket.Id,
            EventId = ticket.EventId,
            EventName = ticket.Event?.Name,
            Category = ticket.Category.ToString(),
            Price = ticket.Price,
            PromoCode = ticket.PromoCode,
            BuyerEmail = ticket.BuyerEmail,
        };
    }

    public async Task<List<TicketResponseDto>> GetTicketByTicketByEventIdAsync(int eventId) //get ticket by event id
    {
        var tickets = await _context.Tickets
            .Where(t => t.EventId == eventId)
            .Select(t => new TicketResponseDto
            {
                Id = t.Id,
                EventId = t.EventId,
                Category = t.Category.ToString(),
                Price = t.Price,
                PromoCode = t.PromoCode,
                BuyerEmail = t.BuyerEmail
            }).ToListAsync();

        return tickets; 

    }

    public async Task<bool> ValidateTicketAsync(TicketValidationDto validationDto) //for scanning tickets on gateentries
    {
        var ticket = await _context.Tickets.FirstOrDefaultAsync(t =>
          t.Id == validationDto.TicketId &&
          t.BuyerEmail == validationDto.BuyerEmail);

        if (ticket == null || ticket.IsUsed)
        {
            return false; //ticket not found or already used 
        }

        ticket.IsUsed = true;
        await _context.SaveChangesAsync();
        return true;
    }

    public async Task<EventAnalyticsDto> GetEventAnalyticsAsync(int eventId) //analytics
    {
        var eventEntity = await _context.Events.FirstOrDefaultAsync(e => e.Id == eventId);

        if(eventEntity == null)
        {
            throw new ArgumentException("Event Not Found");
        }

        var tickets = await _context.Tickets
            .Where(t => t.EventId ==eventId)
            .ToListAsync();

        var ticketsSold = tickets.Count(t => t.BuyerEmail != null);
        var totalRevenue = tickets.Where(t => t.BuyerEmail != null).Sum(t => t.Price);
        var availableTickets = tickets.Count(t => t.BuyerEmail == null);
        var mostPopularCategory = tickets
            .Where(t => t.BuyerEmail != null)
            .GroupBy(t => t.Category)
            .OrderByDescending(g => g.Count())
            .Select(g => g.Key.ToString())
            .FirstOrDefault();

        var promoCodeUsage = tickets
        .Where(t => !string.IsNullOrEmpty(t.PromoCode))
        .GroupBy(t => t.PromoCode)
        .ToDictionary(g => g.Key, g => g.Count());

        return new EventAnalyticsDto
        {
            EventId = eventId,
            EventName = eventEntity.Name,
            TotalTickets = tickets.Count,
            TicketsSold = ticketsSold,
            AvailableTickets = availableTickets,
            TotalRevenue = totalRevenue,
            MostPopularCategory = mostPopularCategory ?? "N/A",
            PromoCodeUsage = promoCodeUsage
        };
    }
}
