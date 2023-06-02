package com.example.npeeinfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "contactServlet", value = "/contactServlet")
public class contactServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().println("<!DOCTYPE html>");
        response.getWriter().println("<html>");
        response.getWriter().println("<head>");
        response.getWriter().println("<link rel=\"stylesheet\" href=\"./css/contactResponse.css\">");
        response.getWriter().println("</head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<div class=\"container\">");
        response.getWriter().println("<h1>谢谢你的反馈</h1>");
        response.getWriter().println("<p>我们已经成功收到了你的消息，会尽快阅读</p>");
        response.getWriter().println("<p>感谢你为NEPP作出贡献！</p>");
        response.getWriter().println("<a href=\"index.jsp\" class=\"btn\">返回首页</a>");
        response.getWriter().println("</div>");
        response.getWriter().println("</body>");
        response.getWriter().println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext sc = getServletContext();
        Connection conn = (Connection) sc.getAttribute("conn");
        String sql ="insert into manager.giveback values(?,?,?)";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,request.getParameter("name"));
            stmt.setString(2,request.getParameter("email"));
            stmt.setString(3,request.getParameter("message"));
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        doGet(request, response);

    }
}
