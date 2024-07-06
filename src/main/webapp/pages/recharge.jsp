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
  <script>
    $(function () {
      $(".submit-button").click(function () {
        var password = $("input[name='password']").val();
        var confirmPassword = $("input[name='confirmPassword']").val();
        if (password == "" || confirmPassword == "") {
          alert("密码不能为空");
          return false;
        }
        if (password != confirmPassword) {
          alert("两次密码不一致");
          return false;
        }
      });
    });
  </script>
</head>

<body>
<div id="down">

  <form action="/user/recharge" method="post" >
    <table>

      <tr>
        <td>输入想充值的金额：</td>
        <td><input type="number" name="money" value="" step="0.01"></td>
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