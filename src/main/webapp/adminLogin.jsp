<%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/5/18
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NEPPinfo-后台管理登录</title>
    <link rel="stylesheet" href="./css/adminLoginServlet.css">
</head>
<body>
<div class="container">
    <form class="form" action="adminLoginServlet" method="post">
        <h2 class="form-title">NEPP-info后台管理登录</h2>
        <div class="form-group">
            <label for="username">用户名:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <button type="submit">登录</button>
        </div>
    </form>
</div>
</body>
<script src="js/adminLogin.js">
</script>
</html>
