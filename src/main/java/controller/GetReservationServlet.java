package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.GroupingDao;
import dao.ReservationDao;
import model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GetReservationServlet")
public class GetReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = -1;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (Exception e) {
            response.setStatus(500);
            return;
        }
        ReservationDao reservationDao = new ReservationDao();
        GroupingDao groupingDao = new GroupingDao();

        Reservation foundReservation = reservationDao.getById(id);
        foundReservation.setGroupingList(groupingDao.getGroupingsPerReservation(id));

        ObjectMapper objectMapper = new ObjectMapper();
        PrintWriter pw = response.getWriter();
        pw.println(objectMapper.writeValueAsString(foundReservation));
    }
}
