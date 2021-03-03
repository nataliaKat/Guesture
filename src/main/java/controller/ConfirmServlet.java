package controller;

import dao.ReservationDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ConfirmServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "*");
        ((HttpServletResponse) response).addHeader("Access-Control-Allow-Methods","GET, OPTIONS, HEAD, PUT, POST");
        ReservationDao reservationDao = new ReservationDao();
        int id = Integer.parseInt(request.getParameter("id"));
        int action = Integer.parseInt(request.getParameter("action"));
        try {
            switch (action) {
                case 1:
                    reservationDao.confirm(id);
                    break;
                case 2:
                    reservationDao.checkIn(id);
                    break;
                case 3:
                    reservationDao.checkOut(id);
                    break;
                case 4:
                    reservationDao.delete(id);
                    break;
                default:
                    response.setStatus(501);
                    return;
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
            return;
        }
        response.setStatus(200);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
