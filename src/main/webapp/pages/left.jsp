<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>左侧菜单</title>
    <!-- 在这里引入你的CSS文件 -->
    <link rel="stylesheet" href="/css/left.css">
    <script>

    </script>
</head>
<body>
<div id="sidebar">
    <h3 class="h1"><span>用户信息</span></h3>
    <ul>
        <li><a href="/user/getUserInfo?id=${user.userId}" target="con">个人信息</a></li>
        <li>
            <a href="/user/updateUser?id=${user.userId}" target="con">修改信息</a>

        </li>
        <li><a href="/pages/editPassword.jsp" target="con">修改密码</a></li>
        <li><a href="/pages/recharge.jsp" target="con">充值余额</a></li>
        <li><a href="/commit/getCommitByUserId?id=${user.userId}" target="con">评论管理</a></li>
    </ul>
</div>
</body>
</html>

