<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <form action="/commit/updateCommitById" method="post">
        <table>
            <tr>
                <td>输入修改后的评论</td>
                <td><input type="text" name="commit" value="${commit.commitContent}"></td>
            </tr>
            <tr>
                <td>选择评分</td>
                <td>
                    <select name="rating">
                        <option value="1" <c:if test="${commit.rating== 1}">selected</c:if>>1星</option>
                        <option value="2" <c:if test="${commit.rating== 2}">selected</c:if>>2星</option>
                        <option value="3" <c:if test="${commit.rating== 3}">selected</c:if>>3星</option>
                        <option value="4" <c:if test="${commit.rating== 4}">selected</c:if>>4星</option>
                        <option value="5" <c:if test="${commit.rating== 5}">selected</c:if>>5星</option>
                    </select>
                </td>
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