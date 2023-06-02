<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %><%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/6/2
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String adminUsername = (String) session.getAttribute("adminUsername");
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
            session.setAttribute("object","users");
        %>
        <div class="function">
            <div class="f-title">OPERATION-操作表单</div>
            <div class="function-wrapper">
                <form action="manageServlet" method="post">
                    <div class="form-row">
                        <input type="text" name="type" value="users" hidden>
                    </div>
                    <div class="form-row">
                        <label>选择操作:</label>
                        <select name="op">
                            <option value="add">增加</option>
                            <option value="delete">删除</option>
                            <option value="adjust">修改</option>
                        </select>
                    </div>
                    <div class="form-row">
                        <%
                            String sql2 = "select * from manager.users";
                            Statement st = adminConn.createStatement();
                            ResultSet rss = st.executeQuery(sql2);
                            ResultSetMetaData rsmd = rss.getMetaData();
                            int columnCount = rsmd.getColumnCount();
                            for(int i=1; i<=columnCount; i++) {
                                String name = rsmd.getColumnName(i);
                        %>
                        <div class="input-row">
                            <label><%= name %>:</label>
                            <input type="text" name="<%= name %>">
                        </div>
                        <% } %>
                    </div>
                    <div class="form-row">
                        <button type="submit">提交</button>
                    </div>
                </form>
            </div>

        </div>
        <div class="manage-list">
            <div class="list-container">
                <table>
                    <tr>
                        <th>email</th>
                        <th>username</th>
                        <th>password</th>
                    </tr>
                    <%
                        String sql = "select * from manager.users";
                        Statement stmt = adminConn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                        while(rs.next()){
                    %>
                    <tr>
                        <td>
                            <%=rs.getString("email")%>
                        </td>
                        <td>
                            <%=rs.getString("username")%>
                        </td>
                        <td>
                            <%=rs.getString("password")%>
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