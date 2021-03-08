package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int resId = Integer.parseInt(request.getParameter("id"));
        String arrival = request.getParameter("arrivalDate");
        String time1 = request.getParameter("arrivalTime");
        String departure = request.getParameter("departureDate");
        String time2 = request.getParameter("departureTime");

        System.out.println(arrival + " " + time1);
        /* Convert Strings arrival and departure to Sql Date */
//
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        java.util.Date date = sdf.parse(arrival);
//        java.sql.Date sqlDateArrival = new java.sql.Date(date.getTime());
//
//        java.util.Date date1 = sdf.parse(departure);
//        java.sql.Date sqlDateDeparture = new java.sql.Date(date1.getTime());
//
//        /* get today's date and convert it to Date type */
//
//        LocalDate localdate = LocalDate.now();
//        Date localDateDate = java.sql.Date.valueOf(localdate);
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
