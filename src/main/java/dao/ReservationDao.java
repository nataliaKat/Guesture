package dao;

import model.Reservation;
import java.util.ArrayList;
import java.util.List;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationDao {

    public List<Reservation> getAll(String username) {
        Connection con = null;
        ResultSet rs = null;
        List<Reservation> reservations = new ArrayList<Reservation>();
        String sql = "SELECT reservationId, username_agency, arrivalDate, arrivalTime, departureDate, departureTime, totalCost, submittedOn FROM Reservation WHERE username_hotel = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                reservations.add(new Reservation(rs.getInt("reservationId"), rs.getString("username_agency"),
                        rs.getDate("arrivalDate"), rs.getString("arrivalTime"), rs.getDate("departureDate"),
                        rs.getString("departureTime"), rs.getDouble("totalCost"), rs.getDate("submittedOn")));
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

    public void edit(final Reservation r) throws SQLException{
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
            stmt.setInt(2, resId);
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
            stmt.setInt(2, resId);
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
