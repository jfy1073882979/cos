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

    <form action="/admin/updateTicketInfo" method="post" >
        <table>
            <input type="hidden" name="ticketId" value="${ticket.ticketId}">
            <tr>
                <td>门票名：</td>
                <td><input type="text" name="ticketName" value="${ticket.ticketName}" class="in" /></td>

            </tr>
            <tr>
                <td>价格：</td>
                <td><input type="text" name="price" value="${ticket.price}" class="in" /></td>
            </tr>
            <tr>
                <td>当前票数:</td>
                <td><input type="number"  name="quantity" value="${ticket.remainingQuantity}" class="in" /></td>
            </tr>

            <tr>
                <td>总票数:</td>
                <td><input type="number" name="total" value="${ticket.totalQuantity}" class="in" /></td>
            </tr>

            <tr>
                <td>所属展会：</td>
                <td><input type="text" name="exhibitionId" value="${ticket.exhibitionId}" class="in" /></td>
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