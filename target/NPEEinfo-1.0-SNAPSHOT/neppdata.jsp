<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: syugaku
  Date: 2023/5/13
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NEPPinfo-考研数据</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="css/neppdata.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@include file="navbar.jsp"%>

<%
    String uni = request.getParameter("uni");
    String search = request.getParameter("search");
    ServletContext sc = request.getServletContext();
    Connection conn = (Connection) sc.getAttribute("conn");
    if (uni == null&&(search==null||search=="")) {
        // 没有uni参数，展示选择院校页面

%>
<div class="choose-container">
    <h1>选择院校</h1>
    <div class="search-container">
        <div class="uni-search">
            <form action="neppdata.jsp" method="get">
                <input type="text" placeholder="输入院校名" name="search">
                <button type="submit">搜索院校</button>
            </form>

        </div>
    </div>
   <div class="uni-container">
       <% try {
           Statement stmt = conn.createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM manager.universities");
           while (rs.next()) { %>
       <div class="university" name="<%= rs.getString("uname")%>">
           <img src="<%= rs.getString("ulogo") %>" alt="<%= rs.getString("uname") %>">
           <div class="uni-information">
               <h2><%= rs.getString("uname") %></h2>
               <p><%= rs.getString("udescription") %></p>
           </div>
       </div>
       <%  }
           rs.close();
           stmt.close();
       } catch (Exception e) {
           e.printStackTrace();
       } %>
   </div>

</div>
<%
}else if (uni == null && search != null) {

%>
<div class="choose-container">
    <h1>选择院校</h1>
    <div class="search-container">
        <div class="uni-search">
            <form action="neppdata.jsp" method="get">
                <input type="text" placeholder="输入院校名" name="search">
                <button type="submit">搜索院校</button>
            </form>

        </div>
    </div>
    <div class="uni-container">
        <% try {
            String searchPattern = "%"+search+"%";
            String sql = "select * from manager.universities where  manager.universities.uname like ? ";
            PreparedStatement stmt = conn.prepareStatement(sql) ;
            stmt.setString(1,searchPattern);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) { %>
        <div class="university" name="<%= rs.getString("uname")%>">
            <img src="<%= rs.getString("ulogo") %>" alt="<%= rs.getString("uname") %>">
            <div class="uni-information">
                <h2><%= rs.getString("uname") %></h2>
                <p><%= rs.getString("udescription") %></p>
            </div>
        </div>
        <%  }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } %>
    </div>

</div>

<%
} else {
    // 存在uni参数，根据uni参数查询数据库并展示院校数据
    String university = request.getParameter("uni");
    String sql = "select major,year2018,year2019,year2020,year2021,year2022 from manager.data where ? = manager.data.uname";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1,university);
    ResultSet rs = stmt.executeQuery();
%>
<div class="choose-container">

    <h1><%=university%>-近年计算机科学与技术考研分数线</h1>
    <div class="search-container">
        <div class="uni-search">
            <form action="neppdata.jsp" method="get">
                <input type="text" placeholder="输入院校名" name="search">
                <button type="submit">搜索院校</button>
            </form>

        </div>
    </div>
    <div class="data-container">
        <%
            while (rs.next()) {
                ArrayList<Double> datalist = new ArrayList<>();
                for (int i = 2018; i <= 2022; i++) {
                    datalist.add(rs.getDouble("year" + i));
                }
        %>
        <div class="show-data">
            <div id="chartContainer<%= rs.getRow() %>"></div>
            <script>
                var dataList<%= rs.getRow() %> = <%= datalist %>;
                var chartConfig<%= rs.getRow() %> = {
                    type: 'line',
                    data: {
                        labels: [2018, 2019, 2020, 2021, 2022],
                        datasets: [{
                            label: '复试最低分数',
                            data: dataList<%= rs.getRow() %>,
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        plugins: {
                            title: {
                                display: true,
                                text: '<%=rs.getString("major")%>',
                                padding: {
                                    top: 10,
                                    bottom: 30
                                },
                                font:{
                                    weight: 'bold',
                                    size:20,
                                    color:'#333',
                                    family:'rial, sans-serif'
                                },
                                align:'center'
                            }
                        }
                    }
                };

                document.addEventListener('DOMContentLoaded', function () {
                    var chartContainer<%= rs.getRow() %> = document.getElementById('chartContainer<%= rs.getRow() %>');
                    var chartCanvas<%= rs.getRow() %> = document.createElement('canvas');
                    chartContainer<%= rs.getRow() %>.appendChild(chartCanvas<%= rs.getRow() %>);

                    var ctx<%= rs.getRow() %> = chartCanvas<%= rs.getRow() %>.getContext('2d');
                    new Chart(ctx<%= rs.getRow() %>, chartConfig<%= rs.getRow() %>);
                });
            </script>
        </div>
        <%
            }
        %>
    </div>


</div>
<%
    }
%>




<%@ include file="footer.jsp"%>
</body>
<script src="js/neppdata.js" type="text/javascript">
</script>
</html>
