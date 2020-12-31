package controller;


import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import model.GroupCustomer;
import model.Grouping;
import service.GroupCustomerService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GroupCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String json = request.getParameter("custs");
        StringBuilder sb = new StringBuilder(json);
        sb.deleteCharAt(0);
        sb.deleteCharAt(sb.length() - 1);
        String[] groups = sb.toString().replace("],[", "]$[").split("\\$");
        int reservationId = Integer.parseInt(request.getParameter("reservation"));
        ObjectMapper mapper = new ObjectMapper()
                .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);;
        for (String g : groups){
            List<GroupCustomer> customers = mapper.readValue(g, mapper.getTypeFactory().constructCollectionType(List.class, GroupCustomer.class));
            request.setAttribute("pelates", customers);
            Grouping grouping  = new Grouping(customers);
            GroupCustomerService groupCustomerService = new GroupCustomerService();
            groupCustomerService.save(grouping, reservationId);
        }
        request.getRequestDispatcher("/index.jsp").forward(request, response);
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
