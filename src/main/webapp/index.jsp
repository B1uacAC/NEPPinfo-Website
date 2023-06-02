<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
   <title>NEPPinfo-考研信息网</title>
<link href="./css/index.css" rel="stylesheet" type="text/css">
   <meta name="author" content="周学文">
   <meta name="keywords" content="考研,考研信息">
   <meta name="description" content="NEPPinfo是一个考研信息提供网站">
</head>
<body>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navbar.jsp"%>
<div id="container" class="container">

   <div class="app">


      <div class="left-bar">
         <div class="left-area">
            <div class="selector">
               <i class="fas fa-tv" data-tooltip="推荐视频"></i>
               <i class="fas fa-rocket" data-tooltip="外部快速通道"></i>
            </div>
            <div class="content">
               <div class="navigation" id="nav1">
                    <ul>
                       <li>
                          <a href="video.jsp?vid=3">计算机408是什么？</a>
                       </li>
                       <li>
                          <a href="video.jsp?vid=4">高数0基础福利</a>
                       </li>
                       <li>
                          <a href="video.jsp?vid=5">408-数据结构与算法课</a>
                       </li>
                       <li>
                          <a href="video.jsp?vid=6">408-计算机组成原理</a>
                       </li>
                       <li>
                          <a href="video.jsp?vid=7">408-计算机操作系统</a>
                       </li>
                    </ul>
               </div>
               <div class="navigation" id="nav2">
                  <ul>
                     <li>
                        <a href="https://yz.chsi.com.cn/yzwb/">硕士统考网报</a>
                     </li>
                     <li>
                        <a href="https://yz.chsi.com.cn/zsml/zyfx_search.jsp">硕士专业目录</a>
                     </li>
                     <li>
                        <a href="https://yz.chsi.com.cn/tm/">推免服务系统</a>
                     </li>
                     <li>
                        <a href="https://account.chsi.com.cn/passport/login?entrytype=ycmsstu&service=https%3A%2F%2Fbm.chsi.com.cn%2Fycms%2Fj_spring_cas_security_check%3Bjsessionid%3D8D5520B8E70FF48871C8AE1ED5143BE7">高校招生远程面试</a>
                     </li>
                     <li>
                        <a href="https://account.chsi.com.cn/passport/login?entrytype=yzgr&service=https%3A%2F%2Fyz.chsi.com.cn%2Fwsqr%2Fj_spring_cas_security_check">硕士报名网上确认</a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>


      </div>

      <div class="banner">
         <div id="slideshow" class="slideshow-container">
            <div class="slides">
               <img src="./css/images/log.jpg" alt="Image 1" class="slide" onclick="redirectTo('img1')">
               <img src="./css/images/log.jpg" alt="Image 2" class="slide"  onclick="redirectTo('img2')">
               <img src="./css/images/log.jpg" alt="Image 3" class="slide"  onclick="redirectTo('img3')">
               <img src="./css/images/log.jpg" alt="Image 4" class="slide"  onclick="redirectTo('img4')">

            </div>
            <div class="dots"></div>
         </div>
      </div>
      <div class="right-bar">
         <div class="news">
            <div class="news-head">  <h3><i class="far fa-calendar-alt"></i>
               &nbsp;最&nbsp;新&nbsp;消&nbsp;息</h3></div>
            <div class="news-list">
               <ul>
                  <%
                     ServletContext sc = request.getServletContext();
                     Connection conn =  (Connection) sc.getAttribute("conn");
                     String sql="select * from manager.passages order by pid desc limit 7";
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(sql);
                     while(rs.next()){

                  %>
                  <li><a href="passage.jsp?pid=<%=rs.getInt("pid")%>"><%=rs.getString("title")%></a></li>
                  <%
                     }
                  %>
               </ul>
            </div>
         </div>
      </div>

</div>


</div>
<%@ include file="footer.jsp"%>

</body>
<script src="./js/index.js" type="text/javascript">
</script>
</html>