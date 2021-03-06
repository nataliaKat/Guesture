package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import dao.ReservationDao;
import model.Hotel;
import model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetAllReservetionsServlet")
public class GetAllReservetionsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PrintWriter pw = response.getWriter();
        ReservationDao reservationDao = new ReservationDao();
        HttpSession session = request.getSession();
        Hotel hotel = (Hotel)session.getAttribute("userObj");
        if (hotel == null) {
            response.setStatus(538);
            return;
        }
        List<Reservation> reservations = new ArrayList<>();
        try {
            reservations = reservationDao.getAll(hotel.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
        }
        ObjectMapper mapper = new ObjectMapper();
        mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        String jsondata = mapper.writeValueAsString(reservations);

        pw.println(jsondata);
    }
}
