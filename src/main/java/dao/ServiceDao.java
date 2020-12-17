package dao;

import model.Service;
import java.util.List;
import java.util.ArrayList;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceDao {

    public List<Service> getAllServices (String hotelName) throws Exception {

        Connection con = null;
        ResultSet rs = null;
        List<Service> services = new ArrayList<Service>();
        String sql = "SELECT * FROM Service WHERE hotel_username = ? ;";
        DB db = new DB();

        try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, hotelName);
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                int serviceId = rs.getInt("serviceId");
                String name = rs.getString("name");
                
                Service service = new Service (serviceId, name, hotelName);

                services.add(service);
            }

            stmt.close();
            rs.close();
            con.close();
            
        } catch (SQLException e) {

            throw new SQLException(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {                

            }
        }

        return services;
        
    } // End of getAllServices

}