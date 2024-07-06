package com.jfy.dao;

import com.jfy.domain.Order;
import com.jfy.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    public List<User> getAllOrderByUserId(Integer userId);
    public User getUserById(Integer userId);
    public List<User> getAllUser();

    public User checkUserName(String username);
    public User checkPhone(String phoneNumber);

    public int addUser(User user);
    public int updateUser(User user);

    public int updateAvatar(@Param("userId") Integer userId,@Param("path") String path);
    public int updatePassword(User user);

    public int updateBalance(User user);

    public Integer deleteUserById(Integer userId);

    public Integer adminUpdateUser(User user);

}
