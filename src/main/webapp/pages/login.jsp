<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script src="/js/jquery-1.8.3.min.js"></script>
    <style>
        body {
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 300px;
            height: 500px;
            background-color: #ffe4e1;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            display: none;
        }

        .logo {
            width: 100px;
            height: 100px;
            object-fit: contain;
            margin-bottom: 20px;
        }


        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #add8e6;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".container").fadeIn(1000);
        });

        $(function () {
            let flag = false;


            // 初始时禁用登录按钮
            $("input[type='submit']").prop("disabled", true);
            //使用ajax验证用户名是否存在
            $("#login-username").blur(function () {

                var username = $("#login-username").val();

                //alert(username)
                $.ajax({
                    url: "/user/checkUserName",
                    type: "post",
                    data: {
                        username: username
                    },
                    dataType: "json",
                    success: function (data) {
                        //console.log(data);
                        if (data) {
                            flag = true;
                            $("login-username").css("border-color", "#ccc");
                            $(".username-tips").html("");
                        } else {
                            flag = false;
                            $("login-username").css("border-color", "red");
                            $(".username-tips").html("用户名不存在");
                        }

                        var password = $("#login-password").val();
                        // 检查输入是否合法
                        if (flag && password) {
                            // 如果输入合法，启用登录按钮并改变其颜色
                            $("input[type='submit']").prop("disabled", false).css("background-color", "darkblue");
                        } else {
                            // 如果输入不合法，禁用登录按钮并保持其原来的颜色
                            $("input[type='submit']").prop("disabled", true).css("background-color", "#add8e6");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error('Ajax request failed:', textStatus, errorThrown);
                    }
                });


            });

            // 监听输入框的 input 事件
            $(" #login-password").on("blur", function () {

                var password = $("#login-password").val();

                // 检查输入是否合法
                if (flag && password) {
                    // 如果输入合法，启用登录按钮并改变其颜色
                    $("input[type='submit']").prop("disabled", false).css("background-color", "darkblue");
                } else {
                    // 如果输入不合法，禁用登录按钮并保持其原来的颜色
                    $("input[type='submit']").prop("disabled", true).css("background-color", "#add8e6");
                }
            });
        });
    </script>
</head>


<body>
<div class="container">
    <img src="/img/logo.png" alt="Logo" class="logo">
    <h2>登录</h2>
    <form id="login-form" action="/user/login" method="post">
        <label for="login-username">用户名:</label>
        <input type="text" id="login-username" name="username" required>
        <span style="color: red" class="username-tips"></span>
        <label for="login-password">密码:</label>
        <input type="password" id="login-password" name="password" required>
        <span class="password-tips"></span>
        <% String msg = (String)session.getAttribute("msg"); %>
        <% if (msg != null) { %>
        <p style="color: red;"><%= msg %></p>
        <% } %>
        <input type="submit" value="登录">
    </form>
    <p>没有账号? <a href="/pages/register.jsp">请先注册</a></p>
</div>
</body>

</html>