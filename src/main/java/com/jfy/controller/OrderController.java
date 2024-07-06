package com.jfy.controller;

import com.jfy.dao.UserMapper;
import com.jfy.domain.Order;
import com.jfy.domain.Ticket;
import com.jfy.domain.User;
import com.jfy.service.OrderService;
import com.jfy.service.TicketService;
import com.jfy.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    public OrderService orderService;
    @Autowired
    public UserService userService;
    @Autowired
    public TicketService ticketService;

    @RequestMapping("submitOrder")
    public String submitOrder(@RequestParam("ticketId") Integer ticketId,
                              @RequestParam("buyQuantity") Integer quantity,
                              @RequestParam("totalCost") BigDecimal totalCost,
                              HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer userId = user.getUserId();
//        System.out.println(userId);

        Order order = new Order();
        order.setUserId(userId);
        order.setTicketId(ticketId);
        order.setTicketQuantity(quantity);
        order.setOrderTime(new Date());
//        System.out.println(order);

        orderService.addOrder(order);
        //更新余额
        user.setBalance(user.getBalance().subtract(totalCost));
        userService.updateBalance(user);
        //更新门票数
        Ticket ticket =new Ticket();
        ticket.setTicketId(ticketId);
        Integer oldQuantity = ticketService.getTicketById(ticketId).getRemainingQuantity();
        ticket.setRemainingQuantity(oldQuantity - quantity);
        ticketService.updateTicketQuantity(ticket);

        return "redirect:/user/getAllOrderByUserId?id=" + userId;
    }

    @RequestMapping("/delById")
    public String deleteById(@RequestParam("orderId") Integer orderId,
                             HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer userId = user.getUserId();
        orderService.delById(orderId);
        return "redirect:/user/getAllOrderByUserId?id=" + userId;
    }
}
