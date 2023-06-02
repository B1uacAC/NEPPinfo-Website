<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/5/18
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ServletContext sc = request.getServletContext();
    Connection conn = (Connection) sc.getAttribute("conn");
    String pid = request.getParameter("pid");
    if(pid==null){
        response.sendRedirect("index.jsp");
    }
    String sql = "select * from manager.passages where pid = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1,pid);
    ResultSet rs = stmt.executeQuery();
    String title = null;
    String passage=null;
    int likes = 0;
    int shares=0;
    String type=null;
    if(rs.next()){
        title = rs.getString("title");
        passage = rs.getString("passage");
        likes = rs.getInt("likes");
        shares =rs.getInt("shares");
        type = rs.getString("type");


    }else{
        response.sendRedirect("index.jsp");
    }
%>
<html>
<head>
    <title>NEPPinfo-<%=title%></title>
    <link rel="stylesheet" href="css/passage.css">
</head>
<body>

<%@include file="navbar.jsp"%>
<div class="article-container">
  <article class="article">
      <h1 class="title"><%= title %></h1>
      <h4 class="type"><a href="passages_types.jsp?type=<%=type%>">分类：<%=type%></a>&nbsp;&nbsp;&nbsp;&nbsp;发表时间：<%=rs.getString("timestamp")%></h4>
      <div class="content"><%= passage %></div>
      <br><br>
      <div class="icons">
          <i class="fas fa-heart"></i>
          <span class="count"><%=likes%></span>&nbsp;&nbsp;
          <i class="fas fa-share"></i>
          <span class="count"><%=shares%></span>
      </div>
  </article>
</div>
<%@include file="footer.jsp"%>


</body>
</html>
