
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>个人信息管理</title>
    <style>
        frameset, frame {
            border: 0;
            margin: 0;
            adding: 0;
        }
    </style>
</head><!-- 页面分帧技术 -->
<frameset rows="60,*" border="0">
    <frame src="/pages/top.jsp" scrolling="no">
    <frameset cols="190,*">
        <frame src="/pages/left.jsp" name="leftFrame" noresize="noresize">
        <frame src="/pages/profile.jsp" name="con">
    </frameset>
</frameset>
</html>
