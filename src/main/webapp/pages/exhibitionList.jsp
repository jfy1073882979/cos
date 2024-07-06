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
<button class="add-button" onclick="window.location.href='/pages/addExhibition.jsp'">新增</button>
<table width="1000px" cellpadding="0" cellspacing="0">
    <thead>
    <tr class="head">
        <td>展会id</td>
        <td>展会名</td>
        <td>封面</td>
        <td>描述</td>
        <td>开放时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${exhibitionList}" var="exhibition" varStatus="status">
        <tr>
            <td>${exhibition.exhibitionId}</td>
            <td>${exhibition.exhibitionName}</td>
            <td><img src="/img/exhibition/${exhibition.exhibitionPic}" width="100px" height="100px"></td>
            <td>${exhibition.content}</td>

            <td>
                <fmt:formatDate value="${exhibition.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <a href="/admin/jumpToUpdateExhibition?exhibitionId=${exhibition.exhibitionId}">编辑</a>&nbsp;
                <a href="/admin/deleteExhibitionById?exhibitionId=${exhibition.exhibitionId}" class="del"
                   onclick="return confirm('确定删除')">删除</a>&nbsp;
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
