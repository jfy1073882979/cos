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
    <form action="/admin/addExhibition" method="post">
        <table>

            <tr>
                <td>展会名：</td>
                <td><input type="text" name="name" class="in"/></td>
            </tr>
            <tr>
                <td>描述：</td>
                <td><input type="text" name="content" class="in"/></td>
            </tr>

            <tr>
                <td>开放时间:</td>
                <td><input type="date" name="releaseTime" class="in"/></td>
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