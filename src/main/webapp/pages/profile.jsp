<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String path = request.getContextPath();
    String
            basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <base href="<%=basePath%>">

    <title>用户信息</title>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/profile.css">
</head>

<body>
<div id="down">
    <table>
        <tr>
            <td>用户头像：</td>
            <td><img src="/img/avatar/${user.avatar}" width="100px" height="100px"></td>
        </tr>
        <tr>
            <td>用户名称：</td>
            <td><input type="text" name="name" value="${user.username}" class="in" disabled/></td>
        </tr>
<%--        <tr>--%>
<%--            <td>用户密码：</td>--%>
<%--            <td><input type="text" name="password" value="${user.password}" class="in" disabled/></td>--%>
<%--        </tr>--%>
        <tr>
            <td>手机号：</td>
            <td><input type="text" name="phone" value="${user.phoneNumber}" class="in" disabled/></td>
        </tr>
        <tr>
            <td>余额: </td>
            <td><input type="text" name="balance" value="${user.balance}" class="in" disabled/></td>
        </tr>
        <tr>
            <td>身份: </td>
<%--            根据user.rid判断,是1就是管理员,是2就是普通用户--%>
            <td><input type="text" name="role" value="${user.rid==1?'管理员':'普通用户'}" class="in" disabled/></td>
        </tr>
    </table>
</div>
</body>

</html>