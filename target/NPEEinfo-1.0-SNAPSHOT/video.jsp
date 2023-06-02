<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/5/19
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NEPPinfo-视频</title>
    <link rel="stylesheet" href="css/video.css">
</head>
<body>
<%@include file="navbar.jsp"%>
<%
    String vid = request.getParameter("vid");
   String sql="select * from manager.videos where manager.videos.vid = ?";
   ServletContext sc = request.getServletContext();
    Connection conn = (Connection) sc.getAttribute("conn");
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1,vid);
    ResultSet rs = stmt.executeQuery();
    if(rs.next()){
%>
<div class="video-container">
    <h1 class="video-title"><%=rs.getString("vname")%></h1>
    <div class="video-content">
        <div class="video-overlay"></div>
        <%=rs.getString("vlink")%>
    </div>
</div>

<%
    }
%>

<%@include file="footer.jsp"%>
</body>

</script>
</html>
