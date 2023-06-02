
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/5/18
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NEPPinfo-文章文类</title>
    <link rel="stylesheet" href="css/passages_types.css">
</head>
<body>

<%@include file="navbar.jsp"%>
<%
    ServletContext sc = request.getServletContext();
    Connection conn = (Connection) sc.getAttribute("conn");
    String type = request.getParameter("type");
    if(type==null||type.equals("全部文章")){
%>
    <div class="types-container">
        <div class="types-bar">
            <%
                String sql = "select * from manager.passages_types";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
            %>
            <div class="type-element">
                <a href="passages_types.jsp?type=<%=rs.getString("type")%>"><%=rs.getString("type")%></a>
            </div>
            <%
                }

            %>
        </div>
        <div class="passages-list">
            <%
                sql = "select * from manager.passages order by manager.passages.pid desc";
                rs = stmt.executeQuery(sql);
                while(rs.next()){
            %>
               <div class="passage-element">
                   <div class="p-title">
                       <a href="passage.jsp?pid=<%=rs.getInt("pid")%>"><%=rs.getString("title")%></a>
                   </div>
                   <div class="metadata">
                       <h5 class="type">分类：<%=rs.getString("type")%>&nbsp;&nbsp;&nbsp;&nbsp;发表时间：<%=rs.getString("timestamp")%></h5>

                       <div class="icons">
                           <i class="fas fa-heart"></i>
                           <span class="count"><%=rs.getInt("likes")%></span>&nbsp;&nbsp;
                           <i class="fas fa-share"></i>
                           <span class="count"><%=rs.getInt("shares")%></span>
                       </div>
                   </div>
               </div>
            <%
                }
            %>
        </div>


    </div>

<%
    }else{
%>
<div class="types-container">
    <div class="types-bar">
        <%
            String sql = "select * from manager.passages_types";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
        %>
        <div class="type-element">
            <a href="passages_types.jsp?type=<%=rs.getString("type")%>"><%=rs.getString("type")%></a>
        </div>
        <%
            }
          stmt.close();
        %>
    </div>
    <div class="passages-list">
        <%
            sql = "select * from manager.passages where manager.passages.type = ? ";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,type);
            rs = pstmt.executeQuery();
            while(rs.next()){
        %>
        <div class="passage-element">
            <div class="p-title">
                <a href="passage.jsp?pid=<%=rs.getInt("pid")%>"><%=rs.getString("title")%></a>
            </div>
            <div class="metadata">
                <h5 class="type">分类：<%=rs.getString("type")%></h5>
                <div class="icons">
                    <i class="fas fa-heart"></i>
                    <span class="count"><%=rs.getInt("likes")%></span>&nbsp;&nbsp;
                    <i class="fas fa-share"></i>
                    <span class="count"><%=rs.getInt("shares")%></span>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>


</div>

<%
        pstmt.close();
    }
%>


<%@include file="footer.jsp"%>
</body>
</html>
