package com.jfy.controller;


import com.jfy.domain.Order;
import com.jfy.domain.User;
import com.jfy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    public UserService userService;

//    @RequestMapping("/getAllUser")
//    public String getAllUser(HttpSession session) {
//        List<User> userList = userService.getAllUser();
//        for (User user : userList) {
//            System.out.println(user);
//        }
//        System.out.println("getAllUser");
//        session.setAttribute("userList", userList);
//
//        return "redirect:/index.jsp";
//    }
//    @RequestMapping("/deleteUserById")
//    public String deleteUserById(@RequestParam("userId") Integer userId, HttpSession session) {
//        userService.deleteUserById(userId);
//        return "redirect:/user/getAllUser";
//    }

//    @RequestMapping("/addUser")
//    public String addUser(@RequestParam("name") String username,
//                          @RequestParam("password") String password,
//                          @RequestParam("phone") String phone,
//                          HttpSession session) {
//        User user = new User();
//        user.setUsername(username);
//        user.setPassword(password);
//        user.setPhoneNumber(phone);
//        userService.addUser(user);
//        return "redirect:/user/getAllUser";
//    }

    @RequestMapping("/getAllUser")
    public String getAllUser(HttpSession session) {
        List<User> userList = userService.getAllUser();
        for (User user : userList) {
            System.out.println(user);
        }
        System.out.println("getAllUser");
        session.setAttribute("userList", userList);

        return "userList";
    }

    @RequestMapping("/checkUserName")
    @ResponseBody
    public boolean checkUsername(@RequestParam("username") String username) {
        boolean exists = userService.checkUserName(username) != null;
        System.out.println("checkUsername");
        System.out.println(userService.checkUserName(username));
        return exists;
    }

    @RequestMapping("/checkPhone")
    @ResponseBody
    public boolean checkPhone(@RequestParam("phoneNumber") String phoneNumber) {
        boolean exists = userService.checkPhone(phoneNumber) != null;
        System.out.println("checkPhone");
        System.out.println(userService.checkPhone(phoneNumber));
        return exists;
    }

    @RequestMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session) {
        User user = userService.checkUserName(username);
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("user", user);
            session.removeAttribute("msg");
            return "redirect:/index.jsp";
        } else {
            session.setAttribute("msg", "用户名或密码错误");
            return "login";
        }
    }

    @RequestMapping("/register")
    public String register(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("phone") String phone,
                           HttpSession session) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setPhoneNumber(phone);
        userService.addUser(user);

        return "login";


    }
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/index.jsp";
    }

    @RequestMapping("/getUserInfo")
    public String getUserInfo(@RequestParam("id") Integer userId, HttpSession session) {
        User user = userService.getUserById(userId);
        session.setAttribute("user", user);
        return "profile";
    }

    @RequestMapping("/updateUser")
    public String updateUser(@RequestParam("id") Integer userId, HttpSession session) {
        User user = userService.getUserById(userId);
        session.setAttribute("user", user);
        return "editProfile";
    }


    @RequestMapping("/updateUserInfo")
    public String updateUserInfo(@RequestParam("avatar") MultipartFile avatar, @RequestParam("name") String name, @RequestParam("phone") String phone, HttpSession session) throws Exception {
        User user = session.getAttribute("user") == null ? null : (User) session.getAttribute("user");
        if (user == null) {
            return "login";
        }
        user.setUsername(name);
        user.setPhoneNumber(phone);
        userService.updateUser(user);


        if(avatar!=null){
            String avatarHash = userService.calculateHash(avatar);
            System.out.println(avatarHash);
            userService.updateAvatar(user.getUserId(), avatarHash);

            //保存文件到webapp/img/avatar
//            String _path="D:\\ideapojo\\cos\\src\\main\\webapp\\img\\avatar\\";
//
//            File _file = new File(_path+avatarHash);
//            avatar.transferTo(_file);

            String path=session.getServletContext().getRealPath("/img/avatar/");

            File dir = new File(path);
            if (!dir.exists()) {

                dir.mkdirs();  // 创建目录
            }
            File file = new File(dir, avatarHash);
            try {
                System.out.printf("文件保存到：%s\n", file.getAbsolutePath());
                avatar.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();  // 打印异常信息
            }

        }
        session.setAttribute("user", user);
        return "redirect:/user/getUserInfo?id="+user.getUserId();
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(@RequestParam("password") String password, HttpSession session) {
        User user = session.getAttribute("user") == null ? null : (User) session.getAttribute("user");
        if (user == null) {
            return "login";
        }
        user.setPassword(password);
        userService.updatePassword(user);
        session.setAttribute("user", user);
        return "redirect:/user/getUserInfo?id="+user.getUserId();
    }

    @RequestMapping("/recharge")
    public String recharge(@RequestParam("money") BigDecimal money, HttpSession session) {
        User user = session.getAttribute("user") == null ? null : (User) session.getAttribute("user");
        if (user == null) {
            return "login";
        }
        if(money==null){
            return "redirect:/recharge.jsp";
        }
        user.setBalance(user.getBalance().add(money));
        userService.updateBalance(user);
        session.setAttribute("user", user);
        return "redirect:/user/getUserInfo?id="+user.getUserId();
    }

    @RequestMapping("/getAllOrderByUserId")
    public String getAllOrderByUserId(@RequestParam("id") Integer userId, HttpSession session) {
        List<Order> orderList = userService.getAllOrderByUserId(userId);
        session.setAttribute("orderList", orderList);
        return "orderList";
    }
}
