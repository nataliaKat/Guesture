package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.RoomDao;
import model.Room;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "GetAllRoomsServlet")
public class GetAllRoomsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        RoomDao roomDao = new RoomDao();
        String hotel = request.getParameter("username");
        List<Room> rooms = roomDao.getAll(hotel);
        final ByteArrayOutputStream out = new ByteArrayOutputStream();
        final ObjectMapper mapper = new ObjectMapper();

        mapper.writeValue(out, rooms);
        final byte[] data = out.toByteArray();
        String jsondata = new String(data);
        pw.println(jsondata);
        System.out.println(jsondata);
    }
}
