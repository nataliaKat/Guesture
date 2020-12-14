package controller;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import model.GroupCustomer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class GroupCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           String customers = request.getParameter("custs");
//        System.out.println(customers);
        List<GroupCustomer> groupCustomers = new ArrayList<GroupCustomer>();
        ObjectMapper mapper = new ObjectMapper()
                .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);;
        List<GroupCustomer> myObjects = mapper.readValue(customers, mapper.getTypeFactory().constructCollectionType(List.class, GroupCustomer.class));
//        for (GroupCustomer gc : myObjects) {
//            System.out.println(gc);
//        }
        request.getRequestDispatcher("/index.jsp").forward(request, response);
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
