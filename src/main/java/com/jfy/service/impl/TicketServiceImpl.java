package com.jfy.service.impl;

import com.jfy.dao.TicketMapper;
import com.jfy.domain.Exhibition;
import com.jfy.domain.Ticket;
import com.jfy.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TicketServiceImpl implements TicketService {
    @Autowired
    public TicketMapper ticketMapper;
    @Override
    public Ticket getTicketById(Integer ticketId) {
        return ticketMapper.getTicketById(ticketId);
    }

    @Override
    public List<Ticket> getTicketByExhId(Integer exhId) {
        return ticketMapper.getTicketByExhId(exhId);
    }

    @Override
    public int updateTicketQuantity(Ticket ticket) {
        return ticketMapper.updateTicketQuantity(ticket);
    }

    @Override
    public List<Ticket> getAllTicket() {
        return ticketMapper.getAllTicket();
    }

    @Override
    public Integer addTicket(Ticket ticket) {
        return ticketMapper.addTicket(ticket);
    }

    @Override
    public Integer deleteTicketById(Integer ticketId) {
        return ticketMapper.deleteTicketById(ticketId);
    }

    @Override
    public Integer updateTicketInfo(Ticket ticket) {
        return ticketMapper.updateTicketInfo(ticket);
    }

}
