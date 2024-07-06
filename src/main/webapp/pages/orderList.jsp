<%--
  Created by IntelliJ IDEA.
  User: jfy
  Date: 2023/12/26/026
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .del {
            color: red;
        }
    </style>
</head>
<body>
<table width="1000px" cellpadding="0" cellspacing="0">
    <thead>
    <tr class="head">
        <td>订单ID</td>
        <td>门票</td>
        <td>门票数量</td>
        <td>门票价格</td>
        <td>共计花费</td>
        <td>下单时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orderList}" var="order" varStatus="status">
        <tr>
            <td>${order.orderId}</td>
            <td>${order.ticketName}</td>
            <td>${order.ticketQuantity}</td>
            <td>${order.ticketPrice}</td>
            <td>${order.ticketQuantity * order.ticketPrice}</td>
            <td>${order.orderTime}</td>
            <td>

                <a href="/order/delById?orderId=${order.orderId}" class="del"
                   onclick="return confirm('确定删除')">删除</a>&nbsp;
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
