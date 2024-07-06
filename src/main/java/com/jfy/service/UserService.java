package com.jfy.service;

import com.jfy.domain.Order;
import com.jfy.domain.User;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

public interface UserService {

    public List<Order> getAllOrderByUserId(Integer userId);
    public User getUserById(Integer userId);
    public List<User> getAllUser();

    public User checkUserName(String username);
    public User checkPhone(String phoneNumber);

    public int addUser(User user);
    public int updateUser(User user);

    public String calculateHash(MultipartFile file) throws Exception;
    public int updateAvatar(Integer userId, String path);
    public int updatePassword(User user);

    public int updateBalance(User user);

    public Integer deleteUserById(Integer userId);

    public Integer adminUpdateUser(User user);

}
