<%--
  Created by IntelliJ IDEA.
  User: jfy
  Date: 2023/12/26/026
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        .add-button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<button class="add-button" onclick="window.location.href='/pages/addTicket.jsp'">新增</button>
<table width="1000px" cellpadding="0" cellspacing="0">
    <thead>
    <tr class="head">
        <td>门票id</td>
        <td>门票名</td>
        <td>价格</td>
        <td>当前/总共票数</td>
        <td>所属展会</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${ticketList}" var="ticket" varStatus="status">
        <tr>
            <td>${ticket.ticketId}</td>
            <td>${ticket.ticketName}</td>
            <td>${ticket.price}</td>
            <td>${ticket.remainingQuantity}/${ticket.totalQuantity}</td>
            <td>${ticket.exhibitionId}</td>
            <td>
                <a href="/admin/jumpToUpdateTicket?ticketId=${ticket.ticketId}">编辑</a>&nbsp;
                <a href="/admin/deleteTicketById?ticketId=${ticket.ticketId}" class="del"
                   onclick="return confirm('确定删除')">删除</a>&nbsp;
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
