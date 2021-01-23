package controller;

import dao.RoomDao;
import model.Room;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RoomRegistrationServlet")
public class RoomRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int number = Integer.parseInt(request.getParameter("number"));
        int floor = Integer.parseInt(request.getParameter("floor"));
        String type = request.getParameter("type");
        String hotelUsername = request.getParameter("username");
        RoomDao roomDao = new RoomDao();
        roomDao.insertRoom(new Room(number, type, floor, hotelUsername));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
