package dao;

import model.Room;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDao {

//    private HotelDao hotelDao;

//    public List<Room> getAll(String hotelUsername) {
//        DB db = new DB();
//        Connection con = null;
//        String sql = "SELECT * FROM room WHERE hotelId = ?";
//        List<Room> rooms = null;
//        try {
//            con = db.getConnection();
//            PreparedStatement pst = con.prepareStatement(sql);
//            pst.setString(1, hotelUsername);
//            ResultSet rs = pst.executeQuery();
//            rooms = new ArrayList<Room>();
//            Hotel owner = hotelDao.getByUsernmame(hotelUsername);
//            while (rs.next()) {
//                rooms.add(new Room(rs.getInt("number"), rs.getString("type"), rs.getInt("floor"), owner));
//            }
//
//            rs.close();
//            pst.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                con.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//        return rooms;
//    }

    public List<Room> getAvailableRooms(Date startDate, Date endDate, String hotelId) {
        DB db = new DB();
        Connection con = null;
        String sql = "select room.roomId, number, type, floor " +
                "from grouping, room " +
                "where grouping.roomId = room.roomId " +
                "and username = ? " +
                "and grouping.reservationId not in (select reservation.reservationId " +
                "from reservation " +
                "where arrivalDate <= ? and departureDate >= ?); ";
        List<Room> rooms = new ArrayList<>();
        PreparedStatement pst = null;
        try {
            con = db.getConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, hotelId);
            pst.setDate(2, endDate);
            pst.setDate(3, startDate);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                rooms.add(new Room(rs.getInt("roomId"), rs.getInt("number"), rs.getString("type"), rs.getInt("floor")));
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
        return rooms;

    }


}
