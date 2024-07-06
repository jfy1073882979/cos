package com.jfy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer userId;
    private String username;
    private String password;
    private BigDecimal balance;
    private Integer rid;
//    private String Avatar;
    private String avatar;
    private String phoneNumber;

    //user->order: 1->n
    private List<Order> orderList;
}
