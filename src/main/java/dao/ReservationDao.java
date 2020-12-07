package dao;

import model.Agency;
import model.Reservation;
import java.util.ArrayList;
import java.util.List;


import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationDao {

    public List<Reservation> getAll(String username) throws Exception {
        Connection con = null;
        ResultSet rs = null;
        List<Reservation> reservations = new ArrayList<Reservation>();
        AgencyDao adao = new AgencyDao();
        String sql = "SELECT reservationId, name, arrivalDate, arrivalTime, departureDate, departureTime, totalCost, submittedOn FROM Reservation, Agency WHERE Reservation.username_agency=Agency.username AND username_hotel = ?;";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                reservations.add(new Reservation(rs.getInt(1), adao.getByName(rs.getString(2)),
                        rs.getDate(3), rs.getString(4), rs.getDate(5),
                        rs.getString(6), rs.getDouble(7), rs.getDate(8)));
            }

            stmt.close();
            rs.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
        return reservations;
    }// End of getAll

    public void delete(int resId) throws Exception {
        Connection con = null;
        String sql = "DELETE FROM Reservation WHERE reservationId = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, resId);
            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }// End of delete

    public void edit(Reservation r) {
        Connection con = null;
        String sql = "UPDATE Reservation SET arrivalDate = ?, arrivalTime = ?, departureDate = ?, departureTime = ? WHERE reservationId = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setDate(1, r.getArrivalDate());
            stmt.setString(2, r.getArrivalTime());
            stmt.setDate(3, r.getDepartureDate());
            stmt.setString(4, r.getDepartureTime());
            stmt.setInt(5, r.getReservationId());
            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }// End of edit

    public void checkIn(int resId) throws Exception {
        Connection con = null;
        String sql = "UPDATE Reservation SET checkin = 'TRUE' WHERE reservationId = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, resId);
            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }// End of checkIn

    public void checkOut(int resId) throws Exception {
        Connection con = null;
        String sql = "UPDATE Reservation SET checkout = 'TRUE' WHERE reservationId = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, resId);
            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }// End of checkOut

}
