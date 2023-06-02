package com.example.npeeinfo;

import javax.jms.Session;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "registerServlet", value = "/registerServlet")
public class registerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           String email = request.getParameter("email");
           String username = request.getParameter("user");
           String passwd = request.getParameter("passwd");
           String repasswd = request.getParameter("repasswd");
           RequestDispatcher rd = null;
        ServletContext servletContext = getServletContext();
        Connection conn = (Connection) servletContext.getAttribute("conn");

        if(email.equals("")||username.equals("")||passwd.equals("")||repasswd.equals("")){
        // 输入有空
      response.sendRedirect("sign.html?message=error1");
    }else if(!passwd.equals(repasswd)){
        // 两次密码不一致
        response.sendRedirect("sign.html?message=error2");
    }else if(passwd.length()<6 || passwd.length()>15){
        //密码太短或者太长
        response.sendRedirect("sign.html?message=error3");
    }
    else {
        String sql="select email from neppinfo.manager.users where ? = neppinfo.manager.users.email";
            try {
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1,email);
                stmt.executeQuery();
                ResultSet rs = stmt.getResultSet();
                if(!rs.next()){
                    //注册成功
                    stmt.close();
                    sql = "insert into neppinfo.manager.users (email,username,password) values (?, ?, ? )";
                    PreparedStatement pst = conn.prepareStatement(sql);
                    pst.setString(1,email);
                    pst.setString(2,username);
                    pst.setString(3,passwd);
                    pst.executeUpdate();
                    System.out.println("created an account.");
                    pst.close();
                   HttpSession session = request.getSession();
                   session.setAttribute("email",email);
                   session.setAttribute("username", username);
                   session.setAttribute("isLoggedIn", true);
                   response.sendRedirect("index.jsp");
                }else{
                    response.sendRedirect("sign.html?message=error4");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            // 邮箱已经存在的情况

    }
    }
}
