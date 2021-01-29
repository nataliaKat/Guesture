package dao;

import model.Grouping;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GroupingDao {

    public int save(Grouping g, int reservationId) {
        DB db = new DB();
        Connection con = null;
        PreparedStatement pst = null;
        String sql = "INSERT INTO grouping(reservationId) VALUES (?)";
        try {
            con = db.getConnection();
            pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, reservationId);
            int affectedRows = pst.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating grouping failed, no rows affected.");
            }

            ResultSet generatedKeys = pst.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            }
            else {
                throw new SQLException("Creating grouping failed, no ID obtained.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return -1;
    }

    public List<Grouping> getGroupingsPerReservation(int reservationId) {
        List<Grouping> groupings = new ArrayList<Grouping>();
        DB db = new DB();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM grouping WHERE reservationId = ?";
        try {
            con = db.getConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, reservationId);
            rs = pst.executeQuery();
            while (rs.next()) {
                Grouping g = new Grouping(rs.getInt("groupingId"), rs.getInt("roomId"));
                groupings.add(g);
            }
            rs.close();
            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return groupings;
    }

    public void setRoomsToGrouping(int roomId, int groupingId) {
        DB db = new DB();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "UPDATE grouping SET roomId = ? WHERE groupingId = ?";
        try {
            con = db.getConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, roomId);
            pst.setInt(2, groupingId);
            pst.executeUpdate();
            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
