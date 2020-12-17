package dao;

import model.Hotel;
import model.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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

//    public List<Room> getAvailableRooms(Date startDate, Date endDate) {
//        DB db = new DB();
//        Connection con = null;
//        String sql = "SELECT * FROM room WHERE "
//    }

}



}
