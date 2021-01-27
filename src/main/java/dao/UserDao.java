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
				sql = "SELECT * FROM user INNER JOIN agency ON  user.username = agency.username where user.username=? AND user.password=?";
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
    
}