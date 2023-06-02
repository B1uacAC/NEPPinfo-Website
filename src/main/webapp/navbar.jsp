<%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/5/10
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 获取会话中的登录状态和用户名
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    String username = (String) session.getAttribute("username");
%>
<link href="./css/struct.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<div class="navbar">
    <div class="guidance-wrapper">
        <div class="guidance">
            <a href="index.jsp">首页</a>
            <a href="neppdata.jsp">考研数据</a>
            <a href="file.jsp">真题</a>
            <a href="passages_types.jsp">文章</a>
            <a href="contact.jsp">联系我们</a>

        </div>
    </div>

    <div id="user-content" class="user-content">
        <% if (isLoggedIn != null && isLoggedIn) { %>
        <span> <%= username %>&nbsp;&nbsp;</span>
        <% } else { %>
        <a href="sign.html">登录｜注册</a>
        <% } %>
    </div>

</div>
<div class="logo">
    <h1><span class="logo-text">NEPP</span><span class="logo-accent">info</span>
        <span class="logo-pics"><i class="fas fa-graduation-cap "></i>
</span>
        <span class="logo-content">&nbsp;&nbsp;&nbsp;&nbsp;Everything You Need For the NEPP !</span>   </h1>

</div>
<script src="./js/struct.js" type="text/javascript">

</script>