<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/5/16
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NEPPinfo-真题</title>
    <link rel="stylesheet" href="css/file.css">
</head>
<body>
<%@include file="navbar.jsp"%>
<% if (isLoggedIn != null && isLoggedIn) {

ServletContext sc = request.getServletContext();
Connection conn = (Connection) sc.getAttribute("conn");
%>


<div class="file-container">

    <div class="left-file-area">
        <h3>TIPS！</h3>
        <p>可以拉动右边的方块到集篮中哦！</p>
    </div>


    <div class="file-choose-area">
        <div class="file-area">
            <%
                String sql = "select * from manager.files";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
            %>

            <div class="file" draggable="true" data-name="<%=rs.getString("fname")%>">
                <div class="upper">
                    <%=rs.getString("fdescription")%>
                </div>
                <div class="bottom">
                    <h3><%=rs.getString("fname")%></h3>
                </div>
            </div>

            <%
                }
            %>
        </div>

    </div>
    <div class="collector-container" id="collector">
        <div class="basket-icon">
            <i class="fas fa-shopping-basket"></i>
        </div>

        <div class="collector-area">
            <form id="nameForm" method="POST" action="downloadServlet">
                <div id="inputNames">

                </div>
                <table id="nameTable"></table>
                <button type="submit">下载</button>
                <button type="button" id="cancel">取消</button>
            </form>
        </div>

    </div>

</div>





<% } else { %>

<div class="loginFirst">
    <h1>请先登录！</h1>
</div>

<% } %>




<%@include file="footer.jsp"%>
</body>
<script src="js/file.js" type="text/javascript"></script>
</html>
