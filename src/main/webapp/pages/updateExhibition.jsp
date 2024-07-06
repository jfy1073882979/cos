<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String path=request.getContextPath(); String basePath=request.getScheme() + "://" +
        request.getServerName() + ":" + request.getServerPort() + path + "/" ; %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <base href="<%=basePath%>">

    <title>展会信息</title>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/profile.css">
</head>

<body>
<div id="down">
    <%--    <form action="/user/updateUserInfo" method="post" enctype="multipart/form-data">--%>
    <form action="/admin/updateExhibitionInfo" method="post" enctype="multipart/form-data">
        <table>
            <input type="hidden" name="exhibitionId" value="${exhibition.exhibitionId}">
            <tr>
                <td>封面：</td>
                <td><img src="/img/exhibition/${exhibition.exhibitionPic}" width="100px" height="100px">
                </td>
                <td>
                    <input type="file" name="cover" accept="image/*">
                </td>
            </tr>
            <tr>
                <td>展会名称：</td>
                <td><input type="text" name="name" value="${exhibition.exhibitionName}" class="in" /></td>
            </tr>
            <tr>
                <td>描述:</td>
                <td><input type="text" name="content" value="${exhibition.content}" class="in" /></td>
            </tr>

            <tr>
                <td>开放时间:</td>
                <fmt:formatDate value="${exhibition.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss" var="releaseTime" />
                <td><input type="date" name="time" value="${releaseTime}" class="in" /></td>
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