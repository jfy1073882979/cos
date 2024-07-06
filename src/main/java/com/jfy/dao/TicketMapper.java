package com.jfy.dao;

import com.jfy.domain.Ticket;

import java.math.BigDecimal;
import java.util.List;

public interface TicketMapper {
    public Ticket getTicketById(Integer ticketId);
//    public Ticket getTicketByExhId(Integer exhId);
    public List<Ticket> getTicketByExhId(Integer exhId);
    public int updateTicketQuantity(Ticket ticket);
    public List<Ticket> getAllTicket();
    public Integer addTicket(Ticket ticket);

    public Integer deleteTicketById(Integer ticketId);

    public Integer updateTicketInfo(Ticket ticket);

}
