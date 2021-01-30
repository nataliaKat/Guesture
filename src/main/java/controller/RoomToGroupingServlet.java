package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.GroupingDao;
import model.Grouping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class RoomToGroupingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String json = request.getParameter("groupings");

        ObjectMapper mapper = new ObjectMapper();

        List<Grouping> groupings = mapper.readValue(json, mapper.getTypeFactory().constructCollectionType(List.class, Grouping.class));
        GroupingDao groupingDao = new GroupingDao();
        for (Grouping g : groupings) {
            groupingDao.setRoomsToGrouping(g.getRoomId(), g.getGroupingId());
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
