package com.example.npeeinfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "manageServlet", value = "/manageServlet")
public class manageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext sc = getServletContext();
        Connection adminConn = (Connection) sc.getAttribute("adminConn");
        String type = request.getParameter("type");
        String op = request.getParameter("op");
        PreparedStatement stmt = null;
        String sql = null;
        switch (type) {
            case "universities":
                String uid = request.getParameter("uid");
                String uname = request.getParameter("name");
                String ulogo = request.getParameter("ulogo");
                String udescription = request.getParameter("udescription");
                switch (op) {
                    case "add":
                        sql = "insert into manager.universities values(?,?,?,?)";
                        try {
                            stmt = adminConn.prepareStatement(sql);
                            stmt.setInt(1, Integer.parseInt(uid));
                            stmt.setString(2, uname);
                            stmt.setString(3, ulogo);
                            stmt.setString(4, udescription);
                            stmt.executeUpdate();
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    case "delete":
                        sql = "delete from manager.universities where uid = ? ";
                        try {
                            stmt = adminConn.prepareStatement(sql);
                            stmt.setInt(1, Integer.parseInt(uid));
                            stmt.executeUpdate();
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    case "adjust":
                        sql = "UPDATE manager.universities SET uname = ?, ulogo = ?,udescription=?  ";
                        try {
                            stmt = adminConn.prepareStatement(sql);
                            stmt.setString(1, uname);
                            stmt.setString(2, ulogo);
                            stmt.setString(3, udescription);
                            stmt.executeUpdate();
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;

                }
                break;
            case "passages":
                break;
            case "users":
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                switch (op) {
                    case "add":
                        sql = "insert into manager.users values(?,?,?)";
                        try {
                            stmt = adminConn.prepareStatement(sql);

                            stmt.setString(1, email);
                            stmt.setString(2, username);
                            stmt.setString(3, password);
                            stmt.executeUpdate();
                        } catch (SQLException e) {
                            throw new RuntimeException(e);

                        }


                }
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");

                response.getWriter().println("<!DOCTYPE html>");
                response.getWriter().println("<html>");
                response.getWriter().println("<head>");
                response.getWriter().println("<link rel=\"stylesheet\" href=\"./css/contactResponse.css\">");
                response.getWriter().println("</head>");
                response.getWriter().println("<body>");
                response.getWriter().println("<div class=\"container\">");
                response.getWriter().println("<h1>修改成功</h1>");
                response.getWriter().println("<p>已经您的信息提交至数据库</p>");
                response.getWriter().println("<a href=\"adminManage.jsp\" class=\"btn\">返回</a>");
                response.getWriter().println("</div>");
                response.getWriter().println("</body>");
                response.getWriter().println("</html>");

        }
    }
}
