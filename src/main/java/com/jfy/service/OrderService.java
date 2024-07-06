package com.jfy.service;

import com.jfy.domain.Order;

public interface OrderService {
    public Integer addOrder(Order order);
    public Integer delById(Integer orderId);
}
