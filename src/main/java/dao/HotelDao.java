package dao;

import model.Hotel;

import java.sql.*;
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

    /**
	 * Register/create new Hotel user.
	 *
	 * @param hotel, Hotel
	 * @throws Exception, if encounter any error.
	 */
	public void register(Hotel hotel) throws Exception {
		Connection con = null;
		String sql = "SELECT * FROM User " +
						"WHERE username = ?";
		DB db = new DB();
		try {
			con = db.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, hotel.getUsername());
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				rs.close();
				pst.close();
				db.close();
				throw new Exception("username already registered");
            }

            String sql1 = "INSERT INTO User(username, password) VALUES (?, ?)";
            pst = con.prepareStatement(sql1);
            pst.setString(1, hotel.getUsername());
            pst.setString(2, hotel.getPassword());
            pst.executeUpdate();

			String sql2 = "INSERT INTO Hotel (username, name, address, phoneNumber, head, description, priceSingle, priceDouble, priceTriple, priceQuadruple)" +
							" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pst = con.prepareStatement(sql2);
			pst.setString(1, hotel.getUsername());
			pst.setString(2, hotel.getName());
			pst.setString(3, hotel.getAddress());
			pst.setString(4, hotel.getPhoneNumber());
            pst.setString(5, hotel.getHead());
            pst.setString(6, hotel.getDescription());
            pst.setDouble(7, hotel.getPriceSingle());
            pst.setDouble(8, hotel.getPriceDouble());
            pst.setDouble(9, hotel.getPriceTriple());
            pst.setDouble(10, hotel.getPriceQuadruple());
			pst.executeUpdate();

			rs.close();
			pst.close();
		} catch(Exception e) {
			throw new Exception(e.getMessage());
		} finally {
            try {
                db.close();
            } catch (Exception e) {

            }
		}
    }
    // end of register

}
