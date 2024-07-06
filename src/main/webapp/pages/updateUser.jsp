<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String path=request.getContextPath(); String basePath=request.getScheme() + "://" +
        request.getServerName() + ":" + request.getServerPort() + path + "/" ; %>

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
    <%--    <form action="/user/updateUserInfo" method="post" enctype="multipart/form-data">--%>
    <form action="/admin/updateUserInfo" method="post" enctype="multipart/form-data">
        <table>
            <input type="hidden" name="userId" value="${_user.userId}">
            <tr>
                <td>用户头像：</td>
                <td><img src="/img/avatar/${_user.avatar}" width="100px" height="100px">
                </td>
                <td>
                    <input type="file" name="avatar" accept="image/*">
                </td>
            </tr>
            <tr>
                <td>用户名称：</td>
                <td><input type="text" name="name" value="${_user.username}" class="in" /></td>
            </tr>
            <tr>
                <td>余额</td>
                <td><input type="number" step="0.01" name="balance" value="${_user.balance}" class="in" /></td>
            </tr>

            <tr>
                <td>身份</td>
                <td><input type="number" name="rid" value="${_user.rid}" class="in" /></td>
            </tr>

            <tr>
                <td>手机号：</td>
                <td><input type="text" name="phone" value="${_user.phoneNumber}" class="in" /></td>
            </tr>
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="提交" class="submit-button">
                    <input type="reset" value="恢复" class="reset-button">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>

</html>