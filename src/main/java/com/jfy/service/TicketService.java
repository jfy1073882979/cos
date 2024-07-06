package com.jfy.service;

import com.jfy.domain.Ticket;

import java.util.List;

public interface TicketService {
    public Ticket getTicketById(Integer ticketId);
//    public Ticket getTicketByExhId(Integer exhId);
    public List<Ticket> getTicketByExhId(Integer exhId);
    public int updateTicketQuantity(Ticket ticket);
    public List<Ticket> getAllTicket();

    public Integer addTicket(Ticket ticket);

    public Integer deleteTicketById(Integer ticketId);

    public Integer updateTicketInfo(Ticket ticket);

}
