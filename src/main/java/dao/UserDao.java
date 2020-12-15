package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


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
		String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
		User user = null;
		try {
			con = db.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (!rs.next()) {
				rs.close();
				pst.close();
			    throw new Exception("Wrong username or password.");
			}
			user = new User(rs.getString("username"), rs.getString("password"), rs.getString("role"));
            rs.close();
            pst.close();          
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {                

            }
		return user;
		}
	} // End of authenticate

	/**
	 * Register/create new User.
	 * 
	 * @param user, User
	 * @throws Exception, if encounter any error.
	 */
	public void register(User user) throws Exception {
		Connection con = null;
		String sql = "SELECT * FROM User " +
						"WHERE username = ?";
		DB db = new DB();
		try {
			con = db.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				rs.close();
				pst.close();
				db.close();
				throw new Exception("username already registered"); 
			}
			String sql = "INSERT INTO Hotel (username, name, address, phoneNumber, head, description, priceSingle, priceDouble, priceTriple, priceQuadruple)" + 
							"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getName());
			pst.setString(3, user.getAddress());
			pst.setString(4, user.getPhoneNumber());
            pst.setString(5, user.getHead());
            pst.setString(6, user.getDescription());
            pst.setDouble(7, user.getPriceSingle());
            pst.setDouble(8, user.getPriceDouble());
            pst.setDouble(9, user.getPriceTriple());
            pst.setDouble(10, user.getPriceQuadruple());
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
	}// end of register

    
}