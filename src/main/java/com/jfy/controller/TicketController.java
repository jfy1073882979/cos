package com.jfy.controller;

import com.jfy.domain.Exhibition;
import com.jfy.domain.Ticket;
import com.jfy.service.ExhibitionService;
import com.jfy.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/ticket")
public class TicketController {
    @Autowired
    public TicketService ticketService;
    @Autowired
    public ExhibitionService exhibitionService;

    @RequestMapping("/getTicketByExhId")
    public String getTicketByExhId(Integer exhibitionId, HttpSession session) {
        System.out.println("getTicketByExhId");
        List<Ticket> ticketList = ticketService.getTicketByExhId(exhibitionId);
        Exhibition exhibition = exhibitionService.getExhibitionById(exhibitionId);
        session.setAttribute("exhibition", exhibition);
        session.setAttribute("ticketList", ticketList);
        return "exhibition";
    }

    @RequestMapping("jumpToOrder")
    public String jumpToOrder(Integer ticketId, HttpSession session) {
        System.out.println("jumpToOrder");
        Ticket ticket = ticketService.getTicketById(ticketId);
        session.setAttribute("ticket", ticket);
        return "newOrder";
    }

    @RequestMapping("/getAllTicket")
    public String getAllTicket(HttpSession session) {
        System.out.println("getAllTicket");
        List<Ticket> ticketList = ticketService.getAllTicket();
        session.setAttribute("ticketList", ticketList);
        return "ticketList";
    }

}
