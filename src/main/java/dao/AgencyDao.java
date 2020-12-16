package dao;

import model.Agency;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AgencyDao {

    public Agency getByName(String name) throws Exception {
        Agency a = null;
        Connection con = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Agency WHERE name = ?;";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
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