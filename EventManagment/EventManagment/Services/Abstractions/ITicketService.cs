using EventManagment.DTO.EventsDto;
using EventManagment.DTO.TicketDtos;

namespace EventManagment.Services.Abstractions;

public interface ITicketService
{
    Task<bool> CreateTicketsForEventAsync(int eventId, List<TicketCreateDto> tickets);
    Task<TicketResponseDto> PurchaseTicketAsync(TicketPurchaseDto ticketDto);
    Task<TicketResponseDto> GetTicketById(int ticketId);
    Task<List<TicketResponseDto>> GetTicketByTicketByEventIdAsync(int eEventId);
    Task<bool> ValidateTicketAsync(TicketValidationDto validationDto);
    Task<EventAnalyticsDto> GetEventAnalyticsAsync(int eventId);
}
