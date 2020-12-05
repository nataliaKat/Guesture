package dao;

import model.GroupCustomer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class GroupCustomerDao {

    public void save(GroupCustomer groupCustomer, int reservationId) {
        Connection con = null;
        String sql = "INSERT INTO group_customer(name, surname, telephone, email, identityNumber, reservationId) " +
                "VALUES(?, ?, ?, ?, ?, ?)";
        DB db = new DB();
        try {
            con = db.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, groupCustomer.getName());
            pst.setString(2, groupCustomer.getSurname());
            pst.setString(3, groupCustomer.getEmail());
            pst.setString(4, groupCustomer.getTelephone());
            pst.setString(5, groupCustomer.getIdentityNumber());
            pst.setInt(6, reservationId);
            pst.executeUpdate();

            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
