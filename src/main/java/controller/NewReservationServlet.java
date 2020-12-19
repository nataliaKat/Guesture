package controller;

import dao.ReservationDao;
import dao.ServiceDao;
import model.Reservation;
import model.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "NewReservationServlet")
public class NewReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hotelName = request.getParameter("hotelName");
        String agencyName = request.getParameter("agencyName");
        String arrival = request.getParameter("arrival");
        String time1 = request.getParameter("time1");
        String departure = request.getParameter("departure");
        String time2 = request.getParameter("time2");
        String numOfPeople = request.getParameter("numOfPeople");
        String n1 = request.getParameter("n1");
        String n2 = request.getParameter("n2");
        String n3 = request.getParameter("n3");
        String n4 = request.getParameter("n4");

        int numOfPeopleInt = Integer.parseInt(numOfPeople);
        int n1Int = Integer.parseInt(n1);
        int n2Int = Integer.parseInt(n2);
        int n3Int = Integer.parseInt(n3);
        int n4Int = Integer.parseInt(n4);


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
            request.setAttribute("message", e.getMessage());
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
        java.sql.Date sqlDateDeparture = new java.sql.Date(date1.getTime());



        /* read names of all checkboxes and turn them to String */

        ReservationDao rd = new ReservationDao();
        ServiceDao sd = new ServiceDao();
        List<Service> services = null;
        try {
            services = sd.getAllServices(hotelName);
        } catch (Exception e) {
            request.getRequestDispatcher("/group_members.jsp").forward(request, response);
        }
        ArrayList<String> name_list = new ArrayList<String>();

        String comments = request.getParameter("comments");

        comments = new String(comments.getBytes("ISO-8859-1"), "UTF-8");

        Reservation reservation = new Reservation(hotelName, agencyName, sqlDateArrival, time1, sqlDateDeparture, time2, numOfPeopleInt, n1Int, n2Int, n3Int, n4Int, comments);
        int savedReservation = rd.insertReservation(reservation);


        for (Service s : services) {
            if (request.getParameter("ser-" + s.getServiceId()) != null) {
                try {
                    sd.save(savedReservation, s.getServiceId());
                } catch (Exception e) {
                    StringWriter sw = new StringWriter();
                    PrintWriter pw = new PrintWriter(sw);
                    e.printStackTrace(pw);
                    request.setAttribute("message", sw.toString());
                    request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
                }

            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
