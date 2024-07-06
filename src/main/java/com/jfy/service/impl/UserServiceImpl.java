package com.jfy.service.impl;

import com.jfy.dao.TicketMapper;
import com.jfy.dao.UserMapper;
import com.jfy.domain.Order;
import com.jfy.domain.User;
import com.jfy.service.UserService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    @Qualifier("userMapper")
    public UserMapper userMapper;


    @Override
    public List<Order> getAllOrderByUserId(Integer userId) {
        List<Order> orderInfo = new ArrayList<>();
        List<User> list= userMapper.getAllOrderByUserId(userId);
        for (User user : list) {
            List<Order> orderList = user.getOrderList();
            orderInfo.addAll(orderList);
        }
        return orderInfo;
    }

    @Override
    public User getUserById(Integer userId) {
        return userMapper.getUserById(userId);
    }

    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    @Override
    public User checkUserName(String username) {
        return userMapper.checkUserName(username);
    }

    @Override
    public User checkPhone(String phoneNumber) {
        return userMapper.checkPhone(phoneNumber);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }


    @Override
    public int updateAvatar(Integer userId, String path) {
        return userMapper.updateAvatar(userId, path);
    }

    @Override
    public int updatePassword(User user) {
        return userMapper.updatePassword(user);
    }

    @Override
    public int updateBalance(User user) {
        return userMapper.updateBalance(user);
    }

    @Override
    public Integer deleteUserById(Integer userId) {
        return userMapper.deleteUserById(userId);
    }

    @Override
    public Integer adminUpdateUser(User user) {
        return userMapper.adminUpdateUser(user);
    }


    @Override
    public String calculateHash(MultipartFile file) throws Exception {
        // 获取文件后缀名
        String originalFilename = file.getOriginalFilename();
        String suffix = null;
        if (originalFilename != null) {
            suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        }

        MessageDigest md = MessageDigest.getInstance("MD5");
        try (InputStream is = file.getInputStream();
             DigestInputStream dis = new DigestInputStream(is, md)) {
            byte[] buffer = new byte[4096];
            while (dis.read(buffer) != -1) {
                // 读取文件，更新哈希
            }
        }

        // 获取哈希值
        byte[] digest = md.digest();

        // 将哈希值转换为十六进制字符串
        StringBuilder sb = new StringBuilder();
        for (byte b : digest) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString() + suffix;
    }
}
