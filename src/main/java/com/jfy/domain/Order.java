package com.jfy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private Integer orderId;
    private Integer userId;
    private Integer ticketId;
    private Integer ticketQuantity;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderTime;

    private String ticketName;
    private BigDecimal ticketPrice;
    //user->order: 1->n
    //private User user;
}
