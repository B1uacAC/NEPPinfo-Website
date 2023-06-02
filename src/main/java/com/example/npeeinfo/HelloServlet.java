package com.example.npeeinfo;

import org.postgresql.Driver;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "helloServlet" , value="/HelloServlet",loadOnStartup = 1)
public class HelloServlet extends HttpServlet implements ServletContextListener {
    Connection conn = null;
    Statement stmt = null;
    ServletContext sc = null;

    public void init() throws ServletException {
        //连接数据库
       super.init();
       try{
           Class.forName("org.postgresql.Driver");
           String sourceURL="jdbc:postgresql://127.0.0.1:5432/neppinfo";
           String user = "zjutuser";
           String passwd ="Indeepside123";

           System.out.println("connecting.");
           conn = DriverManager.getConnection(sourceURL,user,passwd);
           System.out.println("init conn");
           //将数据库连接设置到上下文，以方便使用数据池
               sc = getServletContext();
               sc.setAttribute("conn",conn);

       } catch (ClassNotFoundException e) {
           throw new RuntimeException(e);
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }


    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    public void destroy() {
        try {
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}