package com.jfy.service.impl;

import com.jfy.dao.OrderMapper;
import com.jfy.domain.Order;
import com.jfy.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    public OrderMapper orderMapper;
    @Override
    public Integer addOrder(Order order) {
        return orderMapper.addOrder(order);
    }

    @Override
    public Integer delById(Integer orderId) {
        return orderMapper.delById(orderId);
    }
}
