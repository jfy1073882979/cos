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
<button class="add-button" onclick="window.location.href='/pages/addUser.jsp'">新增</button>
<table width="1000px" cellpadding="0" cellspacing="0">
    <thead>
    <tr class="head">
        <td>用户id</td>
        <td>用户名</td>
        <td>头像</td>
        <td>余额</td>
        <td>身份</td>
        <td>电话号码</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="user" varStatus="status">
        <tr>
            <td>${user.userId}</td>
            <td>${user.username}</td>
            <td><img src="/img/avatar/${user.avatar}" width="50px" height="50px"></td>
            <td>${user.balance}</td>
            <td>
                <c:if test="${user.rid == 1}">
                        管理员
                </c:if>
                <c:if test="${user.rid == 2}">
                        普通用户
                </c:if>

            </td>
            <td>${user.phoneNumber}</td>
            <td>
                <a href="/admin/jumpToUpdateUser?userId=${user.userId}">编辑</a>&nbsp;
                <a href="/admin/deleteUserById?userId=${user.userId}" class="del"
                   onclick="return confirm('确定删除')">删除</a>&nbsp;
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
