package com.jfy.dao;

import com.jfy.domain.Order;

public interface OrderMapper {
    public Integer addOrder(Order order);
    public Integer delById(Integer orderId);
}
