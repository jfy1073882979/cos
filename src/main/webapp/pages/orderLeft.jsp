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
    <h3 class="h1"><span>订单信息</span></h3>
    <ul>
        <li><a href="/pages/newOrder.jsp" target="con">新建订单</a></li>
        <li>
            <a href="/user/getAllOrderByUserId?id=${user.userId}" target="con">历史订单</a>

        </li>

    </ul>
</div>
</body>
</html>

