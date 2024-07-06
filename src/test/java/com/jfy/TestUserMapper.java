package com.jfy;

import com.jfy.domain.Order;
import com.jfy.domain.User;
import com.jfy.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class) // 使用junit4进行测试
@ContextConfiguration("classpath:spring_config.xml") // 加载配置文件
public class TestUserMapper {

    @Autowired
    public UserService userService;
    @Test
    public void testGetAllOrderById() {
        System.out.println("testGetAllOrderById");
        List<Order> orderList= userService.getAllOrderByUserId(1);
        for (Order order : orderList) {
            System.out.println(order);
        }

    }

    @Test
    public void testUpdateBalance() {
        System.out.println("testUpdateBalance");
        User user = new User();
        user.setUserId(1);
        user.setBalance(BigDecimal.valueOf(2233.23));
        userService.updateBalance(user);
    }

    @Test
    public void testDeleteUserById() {
        System.out.println("testDeleteUserById");
        userService.deleteUserById(9);
    }

}
