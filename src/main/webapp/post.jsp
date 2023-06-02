<%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/5/16
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NEPPinfo-发帖</title>
    <link rel="stylesheet" href="css/post.css" type="text/css">
</head>
<body>
<%@include file="navbar.jsp"%>

<div class="post-container">
    <h1>分享经验</h1>
    <form name="postForm" action="postServlet" method="post" onsubmit="return validateForm()">
        <label for="title">标题：</label>
        <input type="text" id="title" name="title">
        <div id="titleError" class="error"></div>

        <label for="content">内容：</label>
        <textarea id="content" name="content"></textarea>
        <div id="contentError" class="error"></div>

        <input type="submit" value="提交">
    </form>
</div>





<%@include file="footer.jsp"%>
</body>
</html>
