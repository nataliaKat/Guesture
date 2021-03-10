package controller;

import dao.ReservationDao;
import model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class EditReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int resId = Integer.parseInt(request.getParameter("id"));
        String arrival = request.getParameter("arrivalDate");
        String time1 = request.getParameter("arrivalTime");
        String departure = request.getParameter("departureDate");
        String time2 = request.getParameter("departureTime");

        /* Convert Strings arrival and departure to Sql Date */
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = null;
        try {
            date = sdf.parse(arrival);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        java.sql.Date sqlDateArrival = new java.sql.Date(date.getTime());

        java.util.Date date1 = null;
        try {
            date1 = sdf.parse(departure);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        java.sql.Date sqlDateDeparture = new java.sql.Date(date1.getTime());

        Reservation r = new Reservation(sqlDateArrival, time1, sqlDateDeparture, time2, resId);
        ReservationDao rd = new ReservationDao();
        try {
            rd.edit(r);
        } catch (Exception e) {
            response.setStatus(501);
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int resId = Integer.parseInt(request.getParameter("id"));
        String arrival = request.getParameter("arrivalDate");
        String time1 = request.getParameter("arrivalTime");
        String departure = request.getParameter("departureDate");
        String time2 = request.getParameter("departureTime");

        System.out.println(" " + arrival + " " + time1);
    }
}
