<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% String path=request.getContextPath(); String
        basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Cosplay展会</title>
    <link rel="stylesheet" type="text/css" href="/css/header.css">
    <style>
        body {
            background-image: url('/img/bg.jpg');
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .exhibition {
            width: 45%;
            margin: 20px;
            padding: 15px;
            background-color: #ffb6c1;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }

        .exhibition:hover {
            background-color: #ff69b4;
            transform: scale(1.05);
        }

        .exhibition-header {
            display: flex;
            justify-content: space-between;
            width: 100%;
            align-items: center;
        }

        .exhibition-header h3 {
            margin: 0;
        }

        .exhibition-content {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-top: 15px;
        }

        .exhibition-img {
            width: 45%;
            border-radius: 10px;
        }

        .exhibition-description {
            width: 45%;
        }

        #exhibition-list {
            margin: 80px auto;
            width: 80%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        #balance {
            display: inline-block;
            padding: 5px 10px;
            border: 1px solid #008000;
            border-radius: 5px;
            background-color: #008000;
            color: #f0f0f0;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        #balance:hover {
            background-color: #f0f0f0;
            color: #008000;
        }
    </style>

    <script src="js/jquery-1.8.3.min.js"></script>
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
                // 获取所有的展会信息
                $('.exhibition').click(function (event) {
                    // 获取展会的id
                    var exhibitionId = $(this).data('id');
                    // 重定向到展会详情页面
                    window.location.href = '/pages/exhibitionInfo.jsp?exhibitionId=' + exhibitionId;
                });
                // 如果用户已经登录，隐藏登录和注册的链接，显示用户信息
                $('#login-link, #register-link').hide();
                $('#profile-link, #order-link, #avatar, #balance').show();
            }


            //模糊查询
            $('#search-bar button').click(function() {
                // 获取用户输入的展会名
                var exhibitionName = $('#search-bar input').val();

                // 使用Ajax向服务器请求所有匹配的展会
                $.ajax({
                    url: '/exh/searchExhibitions',
                    type: 'get',
                    data: { exhibitionName: exhibitionName },
                    dataType:"json",
                    success: function(exhibitions) {

                        $('#exhibition-list').empty();
                        exhibitions.forEach(function (exhibition) {

                            console.log(exhibition)
                            $('#exhibition-list').append(`
                    <div class="exhibition" data-id="${exhibition.exhibitionId}">
                        <div class="exhibition-header">
                            <h3>${exhibition.exhibitionName}</h3>
                            <h3 class="rating">评分${exhibition.rating}</h3>
                        </div>
                        <div class="exhibition-content">
                            <img class="exhibition-img" src="/img/exhibition/${exhibition.exhibitionPic}" alt="${exhibition.exhibitionName}封面" height="150">
                            <div class="exhibition-description">
                                <h3>具体描述:</h3>
                                <p>${exhibition.content}</p>
                                <h3>开展时间:</h3>
                                <p>${exhibition.releaseTime}</p>
                            </div>
                        </div>
                    </div>
                `);
                        });
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Request failed: ' + textStatus + ', ' + errorThrown);
                    }
                });
            });


        });




        // 每隔5秒钟更新一次展会的评分
        setInterval(function() {
            // 遍历每一个展会
            $('.exhibition').each(function() {
                // 获取展会的id
                var exhibitionId = $(this).data('id');
                // 使用Ajax向服务器请求这个展会的最新评分
                $.get('/exh/getExhibitionRating', {exhibitionId: exhibitionId}, function(rating) {
                    // 更新这个展会的评分
                    $(this).find('.rating').text('评分' + rating);
                });
            });
        }, 5000);
    </script>



</head>

<body>
<div id="header">
    <div id="logo">
        <a href="<%=basePath%>index.jsp">
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
        <!-- 管理员后台管理链接 -->
        <c:if test="${user.rid == 1}">
            <a href="/pages/admin.jsp">后台管理</a>
        </c:if>
        <!-- 登录和注册的链接 -->
        <a id="login-link" href="/pages/login.jsp">登录</a> |
        <a id="register-link" href="/pages/register.jsp">注册</a>
        <!-- 用户信息 -->
        <a id="profile-link" href="/pages/userInfo.jsp">查看个人信息</a> |
        <a id="order-link" href="/pages/orderInfo.jsp">查看订单</a>
        <div id="user-dropdown">
            <img id="avatar" src="/img/avatar/${user.avatar}" alt="用户头像" height="30"
                 style="border-radius: 50%;">
            <div id="dropdown-content">
                <a href="/pages/userInfo.jsp">个人信息</a>
                <a href=/pages/orderInfo.jsp">查看订单</a>
                <a id="logout-link" href="/user/logout">登出</a>
            </div>
        </div>
        <a id="balance" href="/pages/recharge.jsp" target="con">¥ ${user.balance}</a>


    </div>

</div>



<div id="exhibition-list">
    <c:forEach var="exhibition" items="${exhibitionList}">
        <div class="exhibition" data-id="${exhibition.exhibitionId}">
            <div class="exhibition-header">
                <h3>${exhibition.exhibitionName}</h3>
                <h3 class="rating">评分${exhibition.rating}</h3>
            </div>
            <div class="exhibition-content">
                <img class="exhibition-img" src="/img/exhibition/${exhibition.exhibitionPic}"
                     alt="${exhibition.exhibitionName}封面" height="150">
                <div class="exhibition-description">
                    <h3>具体描述:</h3>
                    <p>${exhibition.content}</p>
                        <%--使用fmt标签库的formatDate函数格式化日期--%>
                    <h3>开展时间:</h3>
                    <p><fmt:formatDate value="${exhibition.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p> <!-- 使用fmt:formatDate标签格式化日期 -->
                </div>
            </div>
        </div>
    </c:forEach>
</div>


</body>

</html>