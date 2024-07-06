<%--
  Created by IntelliJ IDEA.
  User: jfy
  Date: 2023/12/25/025
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path=request.getContextPath(); String
        basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/header.css">
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script>
        $(document).ready(function () {
            // 检查用户是否已经登录
            var user = "${user}";
            if (!user) {



                // 获取所有的展会信息
                $('.exhibition').click(function (event) {
                    // 显示提示消息
                    alert('请先登录');
                    // 阻止链接的默认行为
                    event.preventDefault();
                    // 重定向到登录页面
                    window.location.href = '/pages/login.jsp';
                });


                // 如果用户没有登录，显示登录和注册的链接，隐藏用户信息
                $('#login-link, #register-link').show();
                $('#profile-link, #order-link, #avatar, #balance').hide();
            } else {
                // 如果用户已经登录，隐藏登录和注册的链接，显示用户信息
                $('#login-link, #register-link').hide();
                $('#profile-link, #order-link, #avatar, #balance').show();
            }
        });

        function changeLeftFrame(src) {
            // 获取左侧栏的frame元素
            var leftFrame = parent.frames['leftFrame'];
            // 改变左侧栏的src属性
            leftFrame.location.href = src;
        }
    </script>
    <style>
        #balance {
            display: inline-block;
            padding: 5px 10px;
            border: 1px solid #008000;
            border-radius: 5px;
            background-color: #008000;
            color: #008000;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        #balance:hover {
            background-color: #008000;
            color: #f0f0f0;
        }

    </style>
</head>
<body>
<div id="header">
    <div id="logo">
        <a href="<%=basePath%>index.jsp" target="_top">
            <img src="/img/logo.png" alt="Cosplay展会" height="50">
        </a>
    </div>

    <div id="title">
        漫展展会
    </div>

    <div id="search-bar">
        <input type="text" placeholder="输入关键字搜索...">
        <button type="button">搜索</button>
    </div>
    <div id="user-info">
        <c:if test="${user.rid == 1}">
            <a href="/pages/userList.jsp" target="con" onclick="changeLeftFrame('/pages/adminLeft.jsp')">后台管理</a>
        </c:if>
        <!-- 登录和注册的链接 -->
        <a id="login-link" href="/pages/login.jsp" target="_self">登录</a> |
        <a id="register-link" href="/pages/register.jsp" target="_self">注册</a>
        <!-- 用户信息 -->
        <a id="profile-link" href="/pages/profile.jsp" target="con" onclick="changeLeftFrame('/pages/left.jsp')">查看个人信息</a> |
        <a id="order-link" href="/pages/orderList.jsp" target="con" onclick="changeLeftFrame('/pages/orderLeft.jsp')">查看订单</a>
        <div id="user-dropdown">
            <img id="avatar" src="/img/avatar/${user.avatar}" alt="用户头像" height="30"
                 style="border-radius: 50%;">
            <div id="dropdown-content">
                <a href="/pages/userInfo.jsp" target="_self">个人信息</a>
                <a href="/pages/orderList.jsp" target="_self">查看订单</a>
                <a id="logout-link" href="/user/logout" target="_self">登出</a>
            </div>
        </div>
        <a id="balance" href="/pages/recharge.jsp" target="con">¥ ${user.balance}</a>
    </div>

</div>

</body>
</html>
