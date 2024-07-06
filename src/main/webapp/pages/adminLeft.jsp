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
    <h3 class="h1"><span>后台管理</span></h3>
    <ul>
        <li><a href="/user/getAllUser" target="con">用户列表</a></li>
<%--        <li>--%>
<%--            <a href="/user/updateUser?id=${user.userId}" target="con">订单管理</a>--%>

<%--        </li>--%>
<%--        <li><a href="/pages/editPassword.jsp" target="con">评论管理</a></li>--%>
        <li><a href="/ticket/getAllTicket" target="con">门票管理</a></li>
        <li><a href="/exh/getAllExhibition" target="con">展会管理</a></li>
    </ul>
</div>
</body>
</html>

