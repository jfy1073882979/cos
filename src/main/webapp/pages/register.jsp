<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

            background-color: #ffe4e1;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
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
        input[type="tel"],
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
    <script>
        $(document).ready(function () {
            $(".container").fadeIn(1000);
            let flag1, flag2, flag3, flag4=false;

            // 初始时禁用注册按钮
            $("input[type='submit']").prop("disabled", true);

            $("#register-username, #register-phone, #register-password, #register-confirm-password").on("input", function () {
                checkFlags();
            });


            $("#register-username").on("blur", function () {
                var username = $("#register-username").val();

                if(username===""){
                    flag1 = false;
                    $("#register-username").css("border-color", "red");
                    $(".username-tips").html("用户名不能为空");
                    checkFlags();
                    return;
                }
                // ajax 请求后端接口，检查用户名是否已存在
                $.ajax({
                    url: "/user/checkUserName",
                    type: "post",
                    data: {
                        username: username
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            // 用户名已存在
                            flag1 = false;
                            $("#register-username").css("border-color", "red");
                            $(".username-tips").html("用户名已存在");

                        } else {
                            // 用户名不存在
                            flag1 = true;
                            $("#register-username").css("border-color", "#ccc");
                            $(".username-tips").html("");

                        }
                        checkFlags();
                    }
                });
            });

            $("#register-phone").on("blur", function () {
                var phone = $("#register-phone").val();
                // 检查手机号码是否已存在并且是否为 11 位数字
                if (phone.length === 11) {
                    $("#register-phone").css("border-color", "#ccc");
                    $(".phone-tips").html("");
                    $.ajax({
                        url: "/user/checkPhone",
                        type: "post",
                        data: {
                            phoneNumber: phone
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data) {
                                // 手机号码已存在
                                flag2 = false;
                                $("#register-phone").css("border-color", "red");
                                $(".phone-tips").html("手机号码已存在");
                            } else {
                                // 手机号码不存在
                                flag2 = true;
                                $("#register-phone").css("border-color", "#ccc");
                                $(".phone-tips").html("");
                            }
                            checkFlags();
                        }
                    });
                } else {
                    flag2 = false;
                    $("#register-phone").css("border-color", "red");
                    $(".phone-tips").html("手机号码格式不正确");
                }
            });

            $("#register-password").on("blur", function () {
                var password = $("#register-password").val();
                if (password.length < 6) {
                    flag3 = false;
                    $("#register-password").css("border-color", "red");
                    $(".password-tips").html("密码长度不能小于 6 位");
                } else {
                    flag3 = true;
                    $("#register-password").css("border-color", "#ccc");
                    $(".password-tips").html("");
                }
                checkFlags();
            });

            $("#register-confirm-password").on("blur", function () {
                var password = $("#register-password").val();
                var confirmPassword = $("#register-confirm-password").val();
                if (password !== confirmPassword) {
                    flag4 = false;
                    $("#register-confirm-password").css("border-color", "red");
                    $(".confirm-password-tips").html("两次输入的密码不一致");
                } else {
                    flag4 = true;
                    $("#register-confirm-password").css("border-color", "#ccc");
                    $(".confirm-password-tips").html("");
                }
                checkFlags();
            });

            function checkFlags() {
                if (flag1 && flag2 && flag3 && flag4) {
                    $("input[type='submit']").prop("disabled", false).css("background-color", "darkblue");
                }else {
                    $("input[type='submit']").prop("disabled", true).css("background-color", "#add8e6");
                }
            }

            $(".submit").on("click",function (){
                if(flag1 && flag2 && flag3 && flag4){
                    $("input[type='submit']").prop("disabled", false).css("background-color", "darkblue");
                    $("#register-form").submit();
                }
                else{
                    $("input[type='submit']").prop("disabled", true).css("background-color", "#add8e6");
                    alert("请检查输入是否正确");
                }
            })


        });
    </script>
</head>

<body>
<div class="container">
    <img src="/img/logo.png" alt="Logo" class="logo">
    <h2>注册</h2>
    <form id="register-form" action="/user/register" method="post">
        <label for="register-username">用户名:</label>
        <input type="text" id="register-username" name="username" required>
        <span style="color: red" class="username-tips"></span>
        <label for="register-phone">手机号码:</label>
        <input type="tel" id="register-phone" name="phone" required>
        <span style="color: red" class="phone-tips"></span>
        <label for="register-password">密码:</label>
        <input type="password" id="register-password" name="password"  required>
        <span style="color: red" class="password-tips"></span>
        <label for="register-confirm-password">确认密码:</label>
        <input type="password" id="register-confirm-password" name="confirm-password" required>
        <span style="color: red" class="confirm-password-tips"></span>
        <input type="submit" class = "submit" value="注册">
    </form>
</div>
</body>

</html>