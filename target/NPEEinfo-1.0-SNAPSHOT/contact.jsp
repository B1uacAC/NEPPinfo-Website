<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="./css/contact.css">
</head>
<body>
<%@ include file="navbar.jsp"%>
<div class="container">
    <h1>联系我们 ｜ CONTACT US</h1>
    <p>如果网站出现了任何错误或不当信息，或者你对我们有意见或建议，欢迎联系我们！</p>
    <form action="contactServlet" method="post">
        <label for="name">你的名字:</label>
        <input type="text" id="name" name="name" placeholder="Your Name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Your Email" required>

        <label for="message">内容:</label>
        <textarea id="message" name="message" placeholder="Your Message" required></textarea>

        <button type="submit">提交</button>
    </form>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
