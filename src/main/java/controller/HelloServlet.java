package controller;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.PrintWriter;


public class HelloServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        System.out.println("hello");
        PrintWriter out = new PrintWriter(response.getWriter(), true);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
