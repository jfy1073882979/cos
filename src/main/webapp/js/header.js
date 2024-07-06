$(document).ready(function () {
    // 检查用户是否已经登录
    var user = "${user}";
    if (!user) {



        // 获取所有的展会信息
        $('.exhibition').click(function (event) {
            // 显示提示消息
            alert('请先登录');
            // 阻止链接的默认行为
            event.preventDefault();
            // 重定向到登录页面
            window.location.href = '/pages/login.jsp';
        });


        // 如果用户没有登录，显示登录和注册的链接，隐藏用户信息
        $('#login-link, #register-link').show();
        $('#profile-link, #order-link, #avatar, #balance').hide();
    } else {
        // 如果用户已经登录，隐藏登录和注册的链接，显示用户信息
        $('#login-link, #register-link').hide();
        $('#profile-link, #order-link, #avatar, #balance').show();
    }
});