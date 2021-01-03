package dao;

import model.Agency;
import model.Hotel;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDao {

    /**
	 * This method is used to authenticate a user.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public User authenticate(String username, String password) throws Exception {
		Connection con = null;
		DB db = new DB();
		String sql = "SELECT * FROM user INNER JOIN hotel ON  user.username = hotel.username where user.username=? AND user.password=?";
		User user = null;
		try {
			con = db.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (!rs.next()) {
				sql = "SELECT * FROM user INNER JOIN hotel ON  user.username = agency.username where user.password=?";
				pst = con.prepareStatement(sql);
				pst.setString(1,username);
				pst.setString(2, password);
				rs = pst.executeQuery();
				if (!rs.next()) {
					rs.close();
					pst.close();
					throw new Exception("Wrong username or password.");
				}
				user = new Agency(rs.getString("username"), rs.getString("password"), rs.getString("name"), rs.getString("telephone"), rs.getString("mail"), rs.getString("vatNumber"), rs.getDate("registrationDate"));

			} else {
                user = new Hotel(rs.getString("username"), rs.getString("password"),  rs.getString("name"), rs.getString("address"), rs.getString("phoneNumber"), rs.getString("head"), rs.getString("description"), rs.getDouble("priceSingle"), rs.getDouble("priceDouble"), rs.getDouble("priceTriple"), rs.getDouble("priceQuadruple"));
			}
            rs.close();
            pst.close();          
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {                

			}
		}
		return user;
	} // End of authenticate

	/**
	 * Register/create new Hotel user.
	 * 
	 * @param hotel, Hotel
	 * @throws Exception, if encounter any error.
	 */
	public void register(Hotel hotel) throws Exception {
		Connection con = null;
		String sql = "SELECT * FROM Hotel " +
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
			String sql1 = "INSERT INTO Hotel (username, name, address, phoneNumber, head, description, priceSingle, priceDouble, priceTriple, priceQuadruple)" +
							" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pst = con.prepareStatement(sql1);
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

			for (String service : hotel.getServices()) {
				String sql2 = "INSERT INTO Service (name, hotel_username) VALUES (?, ?)";
			    pst = con.prepareStatement(sql2);
			    pst.setString(1, service);
				pst.setString(2, hotel.getUsername());
				pst.executeUpdate();
			}

			for (String criterion : hotel.getCriteria()) {
				String sql3 = "INSERT INTO Criterion (name, min, max, username)" + 
				"VALUES ('Cleanness', 1, 10, 'luxury@gmail.com')";
			    pst = con.prepareStatement(sql3);
			    pst.setString(1, criterion);
				pst.setString(2, hotel.getUsername());
				pst.executeUpdate();
			}
			

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
	}// end of register

    
}