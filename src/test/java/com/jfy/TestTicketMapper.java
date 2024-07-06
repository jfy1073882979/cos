package com.jfy;

import com.jfy.domain.Ticket;
import com.jfy.service.TicketService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;

@RunWith(SpringJUnit4ClassRunner.class) // 使用junit4进行测试
@ContextConfiguration("classpath:spring_config.xml")
public class TestTicketMapper {
    @Autowired
    public TicketService ticketService;
    @Test
    public void testGetTicketById() {
        System.out.println("testGetTicketById");
        System.out.println(ticketService.getTicketById(1));
    }

    @Test
    public void testGetTicketByExhId() {
        System.out.println("testGetTicketByExhId");
        System.out.println(ticketService.getTicketByExhId(2));
    }

    @Test
    public void testUpdateTicketQuantity() {
        System.out.println("testUpdateTicketQuantity");
        Ticket ticket = new Ticket();
        ticket.setTicketId(1);
        ticket.setRemainingQuantity(100);
        ticketService.updateTicketQuantity(ticket);
    }

    @Test
    public void testGetAllTicket() {
        System.out.println("testGetAllTicket");
        System.out.println(ticketService.getAllTicket());
    }

    @Test
    public void testAddTicket() {
        System.out.println("testAddTicket");
        Ticket ticket = new Ticket();
        ticket.setExhibitionId(1);
        ticket.setTicketName("test");
        ticket.setPrice(BigDecimal.valueOf(100));
        ticket.setRemainingQuantity(100);
        ticket.setTotalQuantity(100);
        ticketService.addTicket(ticket);
    }

    @Test
    public void testDeleteTicketById() {
        System.out.println("testDeleteTicketById");
        ticketService.deleteTicketById(7);
    }

    @Test
    public void testUpdateTicketInfo() {
        System.out.println("testUpdateTicketInfo");
        Ticket ticket = new Ticket();
        ticket.setTicketId(9);
        ticket.setTicketName("test");
        ticket.setPrice(BigDecimal.valueOf(100));
        ticket.setRemainingQuantity(100);
        ticket.setTotalQuantity(100);
        ticket.setExhibitionId(1);
        ticketService.updateTicketInfo(ticket);
    }


}
