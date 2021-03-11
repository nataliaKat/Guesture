package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import dao.ReservationDao;
import dao.RoomDao;
import dao.ServiceDao;
import model.*;
import service.GroupCustomerService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class GetReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Hotel hotel = (Hotel)session.getAttribute("userObj");
        if (hotel == null) {
            response.setStatus(538);
            return;
        }
        String hotelUsername = hotel.getUsername();
        hotel.setPassword("");
        int id = -1;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (Exception e) {
            response.setStatus(500);
            return;
        }
        ReservationDao reservationDao = new ReservationDao();
        Reservation foundReservation = reservationDao.getReservationOfHotelById(id, hotelUsername);
        GroupCustomerService groupCustomerService = new GroupCustomerService();
        List<Grouping> groups = groupCustomerService.getGroupings(id);
        RoomDao roomDao = new RoomDao();
        for (Grouping g : groups) {
            Room r = roomDao.getById(g.getRoomId());
            g.setRoom(r);
        }
        foundReservation.setGroupingList(groups);

        ServiceDao serviceDao = new ServiceDao();
        List<Service> services;
        try {
            services = serviceDao.getServicesPerReservation(id, hotelUsername);
        } catch (Exception e) {
            response.setStatus(502);
            return;
        }

        ObjectMapper mapper = new ObjectMapper();
        mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        PrintWriter pw = response.getWriter();
        pw.println("{\"reservation\": " + mapper.writeValueAsString(foundReservation));
        pw.println(", \"hotel\": " + mapper.writeValueAsString(hotel));
        pw.println(", \"services\": " + mapper.writeValueAsString(services));
        pw.println("}");
    }
}
