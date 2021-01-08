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



   
}