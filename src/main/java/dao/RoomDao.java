package dao;

import model.Room;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDao {

//    private HotelDao hotelDao;

    public void insertRoom(Room room) {
        DB db = new DB();
        Connection con = null;
        String sql = "INSERT INTO room(number, username, type, floor) VALUES(?, ?, ?, ?)";
        try {
            con = db.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, room.getNumber());
            pst.setString(2, room.getHotelUsername());
            pst.setString(3, room.getType());
            pst.setInt(4, room.getFloor());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Room> getAll(String hotelUsername) {
        DB db = new DB();
        Connection con = null;
        String sql = "SELECT * FROM room WHERE username = ?";
        List<Room> rooms = null;
        try {
            con = db.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, hotelUsername);
            ResultSet rs = pst.executeQuery();
            rooms = new ArrayList<Room>();
            while (rs.next()) {
                rooms.add(new Room(rs.getInt("roomId"), rs.getInt("number"), rs.getString("type"), rs.getInt("floor")));
            }

            rs.close();
            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rooms;
    }

    public List<Room> getAvailableRooms(Date startDate, Date endDate, String hotelId) {
        DB db = new DB();
        Connection con = null;
        String sql = "select * from room as r " +
                "where r.username = ? and r.roomId not in (select room.roomId " +
                                                            "from room " +
                                                            "left join grouping " +
                                                            "on grouping.roomId = room.roomId " +
                                                            "where grouping.reservationId in (select reservation.reservationId as id " +
                                                                                            "from reservation " +
                                                                                            "where (arrivalDate >= ? and departureDate <= ?) " +
                                                    "                                        or (arrivalDate <= ? and departureDate >= ?) " +
                                                    "                                        or (arrivalDate <= ? and departureDate >= ?) " +
                                                    "                                        or (arrivalDate <= ? and departureDate >= ?)));";
        List<Room> rooms = new ArrayList<>();
        PreparedStatement pst = null;
        try {
            con = db.getConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, hotelId);
            pst.setDate(2, startDate);
            pst.setDate(3, endDate);
            pst.setDate(4, startDate);
            pst.setDate(5, endDate);
            pst.setDate(6, startDate);
            pst.setDate(7, startDate);
            pst.setDate(8, endDate);
            pst.setDate(9, endDate);
            ResultSet rs = pst.executeQuery();
            System.out.println("startdate is " + startDate);
            System.out.println("endate is " + endDate);
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

    public Room getById(int id) {
        DB db = new DB();
        Connection con = null;
        String sql = "SELECT * FROM room WHERE roomId = ?";
        Room room = null;
        try {
            con = db.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                room = new Room(rs.getInt("roomId"), rs.getInt("number"), rs.getString("type"), rs.getInt("floor"));
            }
            rs.close();
            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return room;
    }


}
