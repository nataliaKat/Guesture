package dao;

import model.GroupCustomer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GroupCustomerDao {

    public void save(GroupCustomer groupCustomer, int groupingId) {
        Connection con = null;
        String sql = "INSERT INTO groupcustomer(name, surname, telephone, email, identityNumber, groupingId) " +
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
            pst.setInt(6, groupingId);
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


    public List<GroupCustomer> getCustomersPerGrouping(int groupingId) {
        DB db = new DB();
        Connection con = null;
        List<GroupCustomer> groupCustomers = new ArrayList<GroupCustomer>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM groupcustomer WHERE groupingId = ?";
        try {
            con = db.getConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, groupingId);
            rs = pst.executeQuery();
            while (rs.next()) {
                groupCustomers.add(new GroupCustomer(
                        rs.getInt("customerId"), rs.getString("name"),
                        rs.getString("surname"), rs.getString("telephone"),
                        rs.getString("email"), rs.getString("identityNumber")
                ));
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
        return groupCustomers;
    }
}
