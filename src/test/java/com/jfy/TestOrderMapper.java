package com.jfy;

import com.jfy.domain.Order;
import com.jfy.service.OrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class) // 使用junit4进行测试
@ContextConfiguration("classpath:spring_config.xml")
public class TestOrderMapper {
    @Autowired
    public OrderService orderService;

    @Test
    public void testAddOrder() {
        System.out.println("testAddOrder");
        Order order = new Order();
        order.setUserId(3);
        order.setTicketId(1);
        order.setTicketQuantity(2);
        order.setOrderTime(new Date());
        orderService.addOrder(order);
    }

    @Test
    public void testDeleteById() {
        System.out.println("testDeleteById");
        orderService.delById(18);
    }

}
