package dao;

import model.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceDao {

    public List<Service> getAllServices (String hotelName) throws Exception {

        Connection con = null;
        ResultSet rs = null;
        List<Service> services = new ArrayList<Service>();
        String sql = "SELECT * FROM Service WHERE hotel_username = ? ;";
        DB db = new DB();

        try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, hotelName);
            rs = stmt.executeQuery();

            while (rs.next()) {

                int serviceId = rs.getInt("serviceId");
                String name = rs.getString("name");

                Service service = new Service (serviceId, name, hotelName);

                services.add(service);
            }

            stmt.close();
            rs.close();
            con.close();

        } catch (SQLException e) {

            throw new SQLException(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }
        }

        return services;

    } // End of getAllServices

    public List<Service> getServicesPerReservation (int reservationId, String hotelName) throws Exception {

        Connection con = null;
        ResultSet rs = null;
        List<Service> services = new ArrayList<Service>();
        String sql = "SELECT Service.name, Service.serviceId FROM Service, Reservation_Service WHERE Reservation_Service.serviceId = Service.serviceId AND reservationId=?";
        DB db = new DB();

        try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, reservationId);
            rs = stmt.executeQuery();

            while (rs.next()) {

                String serviceName = rs.getString("name");
                int serviceId = rs.getInt("serviceId");

                Service service = new Service (serviceId, serviceName, hotelName);

                services.add(service);
            }

            stmt.close();
            rs.close();
            con.close();

        } catch (SQLException e) {

            throw new SQLException(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }
        }

        return services;
    }

    public void save(int reservationID, int serviceId) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement pst = null;
        String sql = "INSERT INTO reservation_service VALUES (?, ?)";
        try {
            con = db.getConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, reservationID);
            pst.setInt(2, serviceId);
            pst.executeUpdate();
            pst.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }

    }

}
