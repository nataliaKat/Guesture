package dao;

import model.Hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HotelDao {

    public List<Hotel> getAll() {
        List<Hotel> hotels = new ArrayList<>();
        DB db = new DB();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement pst;
        String sql = "SELECT * FROM hotel";
        try {
            con = db.getConnection();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                hotels.add(new Hotel(rs.getString("username"), rs.getString("name"), rs.getString("address"), rs.getString("phoneNumber"), rs.getString("head"), rs.getString("description"), rs.getString("photo_url")));
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
        return hotels;
    }

}
