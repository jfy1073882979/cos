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
    </style>
</head>
<body>
<table width="1000px" cellpadding="0" cellspacing="0">
    <thead>
    <tr class="head">
        <td>展会</td>
        <td>评论内容</td>
        <td>评分</td>
        <td>评论时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${commits}" var="commit" varStatus="status">
        <tr>
            <td>${commit.exhibitionName}</td>
            <td>${commit.commitContent}</td>
            <td>${commit.rating}</td>
            <td>
            <fmt:formatDate value="${commit.commitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <a href="/commit/jumpToEditCommit?commitId=${commit.commitId}">编辑</a>&nbsp;
                <a href="/commit/deleteCommitById?commitId=${commit.commitId}" class="del"
                   onclick="return confirm('确定删除')">删除</a>&nbsp;
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
