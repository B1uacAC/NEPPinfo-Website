<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/6/2
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String adminUsername = (String) session.getAttribute("adminUsername");
    int level = (int)session.getAttribute("level");
    if(adminUsername==null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<html>
<head>
    <title>COMMAND</title>
    <link rel="stylesheet" href="css/management.css">
</head>
<body>
<div class="function-container">
    <div class="main-wrapper">
        <%
            ServletContext sc = request.getServletContext();
            Connection adminConn = (Connection) sc.getAttribute("adminConn");
            session.setAttribute("object","giveback");
        %>
        <div class="manage-list">
            <div class="list-container">
                <table>
                    <tr>
                        <th>email</th>
                        <th>name</th>
                        <th>message</th>
                    </tr>
                    <%
                        String sql = "select * from manager.giveback";
                        Statement stmt = adminConn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                        while(rs.next()){
                    %>
                    <tr>
                        <td>
                            <%=rs.getString("email")%>
                        </td>
                        <td>
                            <%=rs.getString("name")%>
                        </td>
                        <td>
                            <%=rs.getString("message")%>
                        </td>
                    </tr>


                    <%
                        }
                    %>
                </table>
            </div>


        </div>
    </div>
</div>




</body>
</html>