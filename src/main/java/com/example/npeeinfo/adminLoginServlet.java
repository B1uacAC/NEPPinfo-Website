package com.example.npeeinfo;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "adminLoginServlet", value = "/adminLoginServlet")
public class adminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String adminUsername = request.getParameter("username");
        String passwd = request.getParameter("password");
        ServletContext sc = getServletContext();
        Connection adminConn = null;
        try{
            try{
                Class.forName("org.postgresql.Driver");
                String sourceURL="jdbc:postgresql:<URL>";
                String user = "<username>";
                String password ="<passwd>";

                System.out.println("admin_connecting.");
                adminConn = DriverManager.getConnection(sourceURL,user,password);
                System.out.println("init admin_conn");
                //将数据库连接设置到上下文，以方便使用数据池
                sc = getServletContext();
                sc.setAttribute("adminConn",adminConn);

            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            System.out.println("connecting-admins.");
            System.out.println("init conn-admins");
            String sql = "select username,password,level from manager.administrators where username = ?";
            PreparedStatement stmt = adminConn.prepareStatement(sql);
            stmt.setString(1,adminUsername);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                if(!rs.getString("password").equals(passwd)){
                    response.sendRedirect("adminLogin.jsp?error=true");
                }else{
                    HttpSession session = request.getSession();
                    session.setAttribute("adminUsername",rs.getString("username"));
                    session.setAttribute("level",rs.getInt("level"));
                    response.sendRedirect("adminManage.jsp");

                }
            }else{
                response.sendRedirect("adminLogin.jsp?error=true");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
