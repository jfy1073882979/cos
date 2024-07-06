package com.jfy.controller;

import com.jfy.domain.Exhibition;
import com.jfy.domain.Ticket;
import com.jfy.domain.User;
import com.jfy.service.ExhibitionService;
import com.jfy.service.TicketService;
import com.jfy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    public UserService userService;
    @Autowired
    public TicketService ticketService;
    @Autowired
    public ExhibitionService exhibitionService;


    @RequestMapping("/deleteUserById")
    public String deleteUserById(@RequestParam("userId") Integer userId, HttpSession session) {
        userService.deleteUserById(userId);
        return "redirect:/user/getAllUser";
    }

    @RequestMapping("/deleteTicketById")
    public String deleteTicketById(@RequestParam("ticketId") Integer ticketId, HttpSession session) {
        ticketService.deleteTicketById(ticketId);
        return "redirect:/ticket/getAllTicket";
    }

    @RequestMapping("/deleteExhibitionById")
    public String deleteExhibitionById(@RequestParam("exhibitionId") Integer exhibitionId, HttpSession session) {
        exhibitionService.deleteExhibitionById(exhibitionId);
        return "redirect:/exh/getAllExhibition";
    }


    @RequestMapping("/addUser")
    public String addUser(@RequestParam("name") String username,
                          @RequestParam("password") String password,
                          @RequestParam("phone") String phone,
                          HttpSession session) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setPhoneNumber(phone);
        userService.addUser(user);
        return "redirect:/user/getAllUser";
    }


    @RequestMapping("/jumpToUpdateUser")
    public String jumpToUpdateUser(@RequestParam("userId") Integer userId, HttpSession session) {
        User user = userService.getUserById(userId);
        session.setAttribute("_user", user);
        return "updateUser";
    }

    @RequestMapping("/jumpToUpdateTicket")
    public String jumpToUpdateTicket(@RequestParam("ticketId") Integer ticketId, HttpSession session) {
        Ticket ticket = ticketService.getTicketById(ticketId);
        session.setAttribute("ticket", ticket);
        return "updateTicket";
    }
    @RequestMapping("/jumpToUpdateExhibition")
    public String jumpToUpdateExhibition(@RequestParam("exhibitionId") Integer exhibitionId, HttpSession session) {
        Exhibition exhibition = exhibitionService.getExhibitionById(exhibitionId);
        session.setAttribute("exhibition", exhibition);
        return "updateExhibition";
    }


    @RequestMapping("/updateUserInfo")
    public String updateUserInfo(@RequestParam("userId") Integer userId,
                                 @RequestParam("avatar") MultipartFile avatar,
                                 @RequestParam("name") String username,
                                 @RequestParam("balance") BigDecimal balance,
                                 @RequestParam("rid") Integer rid,
                                 @RequestParam("phone") String phone,
                                 HttpSession session) throws Exception {

        User user = userService.getUserById(userId);
        user.setUsername(username);
        user.setPhoneNumber(phone);
        user.setBalance(balance);
        user.setRid(rid);
        userService.adminUpdateUser(user);
        if (avatar != null) {
            String avatarHash = userService.calculateHash(avatar);
            System.out.println(avatarHash);
            userService.updateAvatar(user.getUserId(), avatarHash);

            String path = session.getServletContext().getRealPath("/img/avatar/");

            File dir = new File(path);
            if (!dir.exists()) {

                dir.mkdirs();  // 创建目录
            }
            File file = new File(dir, avatarHash);
            try {
                System.out.printf("文件保存到：%s\n", file.getAbsolutePath());
                avatar.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();  // 打印异常信息
            }

        }


        return "redirect:/user/getAllUser";
    }
    @RequestMapping("/updateTicketInfo")
    public String updateTicketInfo(@RequestParam("ticketId") Integer ticketId,
                                   @RequestParam("ticketName") String name,
                                   @RequestParam("price") BigDecimal price,
                                   @RequestParam("quantity") Integer quantity,
                                   @RequestParam("total") Integer total,
                                   @RequestParam("exhibitionId") Integer exhibitionId,
                                   HttpSession session) {

        Ticket ticket = ticketService.getTicketById(ticketId);
        ticket.setExhibitionId(exhibitionId);
        ticket.setTicketName(name);
        ticket.setPrice(price);
        ticket.setRemainingQuantity(quantity);
        ticket.setTotalQuantity(total);
        ticketService.updateTicketInfo(ticket);

        return "redirect:/ticket/getAllTicket";
    }

    @RequestMapping("/updateExhibitionInfo")
    public String updateExhibitionInfo(@RequestParam("exhibitionId") Integer exhibitionId,
                                       @RequestParam("cover") MultipartFile cover,
                                       @RequestParam("name") String name,
                                       @RequestParam("content") String content,
                                       @RequestParam("time") @DateTimeFormat(pattern = "yyyy-MM-dd")Date releaseTime,
                                       HttpSession session) throws Exception {

        Exhibition exhibition = exhibitionService.getExhibitionById(exhibitionId);
        exhibition.setExhibitionName(name);
        exhibition.setContent(content);
        exhibition.setReleaseTime(releaseTime);
        exhibitionService.updateExhibitionInfo(exhibition);

        if (cover != null) {
            String avatarHash = userService.calculateHash(cover);
            System.out.println(avatarHash);
            exhibitionService.updateExhibitionPic(exhibitionId, avatarHash);
            String path = session.getServletContext().getRealPath("/img/exhibition/");

            File dir = new File(path);
            if (!dir.exists()) {

                dir.mkdirs();  // 创建目录
            }
            File file = new File(dir, avatarHash);
            try {
                System.out.printf("文件保存到：%s\n", file.getAbsolutePath());
                cover.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();  // 打印异常信息
            }

        }


        return "redirect:/exh/getAllExhibition";
    }


    @RequestMapping("/addTicket")
    public String addTicket(@RequestParam("name") String name,
                            @RequestParam("price") BigDecimal price,
                            @RequestParam("number") Integer quantity,
                            @RequestParam("total") Integer total,
                            @RequestParam("exhibitionId") Integer exhibitionId,
                            HttpSession session) {

        Ticket ticket = new Ticket();
        ticket.setExhibitionId(exhibitionId);
        ticket.setTicketName(name);
        ticket.setPrice(price);
        ticket.setRemainingQuantity(quantity);
        ticket.setTotalQuantity(total);
        ticketService.addTicket(ticket);


        return "redirect:/ticket/getAllTicket";
    }

    @RequestMapping("/addExhibition")
    public String addExhibition(@RequestParam("name") String name,
                                @RequestParam("content") String content,
                                @RequestParam("releaseTime") @DateTimeFormat(pattern = "yyyy-MM-dd")Date releaseTime,
                                HttpSession session) {
        Exhibition exhibition = new Exhibition();
        exhibition.setExhibitionName(name);
        exhibition.setContent(content);
        exhibition.setReleaseTime(releaseTime);

        exhibitionService.addExhibition(exhibition);
        return "redirect:/exh/getAllExhibition";

    }


}
