package controller;

import dao.RoomDao;
import model.Hotel;
import model.Room;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RoomRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = "";
        int number = -245;
        try {
            number = Integer.parseInt(request.getParameter("number"));
        } catch (NumberFormatException e) {
            message += "You should give a number for room number\n";
        }
        int floor = -245;
        try {
            floor = Integer.parseInt(request.getParameter("floor"));
        } catch (NumberFormatException e) {
            message += "You should give a number for floor\n";
        }

        if (!message.equals("")) {
            response.getWriter().print(message);
        } else {
            String type = request.getParameter("type");
            HttpSession session = request.getSession();
            String hotelUsername = ((Hotel)session.getAttribute("userObj")).getUsername();
            RoomDao roomDao = new RoomDao();
            Room roomToInsert = new Room(number, type, floor, hotelUsername);
            System.out.println(roomToInsert);
            roomDao.insertRoom(roomToInsert);
            response.getWriter().print("Room Inserted");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
