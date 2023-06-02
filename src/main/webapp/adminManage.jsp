<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/5/18
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String adminUsername = (String) session.getAttribute("adminUsername");
    if(adminUsername==null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
        int level = (int) session.getAttribute("level");
        ServletContext sc = request.getServletContext();
        Connection conn = (Connection) sc.getAttribute("adminConn");

%>
<html>
<head>
    <title>NEPPinfo-后台管理</title>
    <link rel="stylesheet" href="css/adminManage.css">
    <link rel="stylesheet" href="css/struct.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<div class="container">

    <div class="admin-title">
        <div class="logo">
            <h1><span class="logo-text">NEPP</span><span class="logo-accent">info</span>
                <span class="logo-pics"><i class="fas fa-graduation-cap "></i>
</span>
                <span class="logo-content">&nbsp;后台管理系统&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<i class="fas fa-medal"></i>-<%=level%>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-user"></i>-<%=adminUsername%></span>   </h1>
        </div>
    </div>
    <div class="main-wrapper">
        <div class="main">
            <div class="side-bar-wrapper">
             <div class="side-bar">
                 <div class="side-bar-title">
                     <i class="fas fa-bars fa-2x"></i>&nbsp;&nbsp;&nbsp;<span class="menu">MENU</span>
                 </div>
                 <div class="side-bar-content">

                          <%
                              String sql = "select object,icon from manager.manage where level = ?";
                              PreparedStatement stmt = conn.prepareStatement(sql);
                              stmt.setInt(1,level);
                              ResultSet rs = stmt.executeQuery();
                              while(rs.next()){
                          %>
                          <div class="side-bar-option" name="option" id=<%=rs.getString("object")%>>
                              <div class="option-main">
                                  <div class="option-left">
                                      <%=rs.getString("icon")%>
                                  </div>
                                  <div class="option-right">
                                      <%=rs.getString("object")%>
                                  </div>
                              </div>
                          </div>
                          <%
                              }
                          %>

                 </div>
             </div>
            </div>
            <div id="manage-container" class="manage-container">

            </div>
        </div>
    </div>


</div>
</body>
<script src="js/adminMange.js" type="text/javascript">
</script>
</html>
