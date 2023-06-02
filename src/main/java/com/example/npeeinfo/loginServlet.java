package com.example.npeeinfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("passwd");

        // 在会话中存储登录状态和用户名
        ServletContext servletContext = getServletContext();
        Connection conn = (Connection) servletContext.getAttribute("conn");
        String sql = "select email,username from manager.users where ? = manager.users.email";
        try {
            PreparedStatement pstmt  = conn.prepareStatement(sql);
            pstmt.setString(1,email);
            pstmt.executeQuery();
            ResultSet rs = pstmt.getResultSet();
            if(rs.next()){
                //jdbc 验证成功
                String username = rs.getString("username");
                HttpSession session = request.getSession();
                session.setAttribute("isLoggedIn", true);
                session.setAttribute("username", username);
                session.setAttribute("email",email);
                response.sendRedirect("index.jsp");
            }else{
                response.sendRedirect("sign.html?message=error5");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }





    }
}
