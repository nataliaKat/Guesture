package dao;

import model.Agency;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AgencyDao {

    public Agency getByUsername(String username) throws Exception {
        Agency a = null;
        Connection con = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Agency WHERE username = ?;";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            if (rs.next()) {
                a = new Agency(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
        return a;
    }

    /**
	 * Register/create new Agency user.
	 * 
	 * @param agency, Agency
	 * @throws Exception, if encounter any error.
	 */
	public void register(Agency agency) throws Exception {
		Connection con = null;
		String sql = "SELECT * FROM User " +
						"WHERE username = ?";
		DB db = new DB();
		try {
			con = db.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, agency.getUsername());
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				rs.close();
				pst.close();
				db.close();
				throw new Exception("username already registered"); 
            }
            
            String sql1 = "INSERT INTO User(username, password) VALUES (?, ?)";
            pst = con.prepareStatement(sql1);
            pst.setString(1, agency.getUsername());
            pst.setString(2, agency.getPassword());
            pst.executeUpdate();

			String sql2 = "INSERT INTO Agency (name, telephone, mail, vatNumber, registrationDate, username) VALUES (?, ?, ?, ?, ?, ?)";
			pst = con.prepareStatement(sql2);
			pst.setString(1, agency.getName());
			pst.setString(2, agency.getTelephone());
			pst.setString(3, agency.getMail());
            pst.setString(4, agency.getVatNumber());
            pst.setString(5, agency.getRegistrationDate());
            pst.setDouble(6, agency.getUsername());
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