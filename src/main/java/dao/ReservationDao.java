package dao;

import model.Reservation;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ReservationDao {

    public List<Reservation> getAll(String username) throws Exception {
        Connection con = null;
        ResultSet rs = null;
        List<Reservation> reservations = new ArrayList<Reservation>();
        String sql = "SELECT * FROM reservation WHERE username_hotel = ?;";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                int reservationId = rs.getInt("reservationId");
                Date arrivalDate = rs.getDate("arrivalDate");
                String arrivalTime = rs.getString("arrivalTime");
                Date departureDate = rs.getDate("departureDate");
                String departureTime = rs.getString("departureTime");
                Date submittedOn = rs.getDate("submittedOn");
                boolean checkin = rs.getBoolean("checkin");
                boolean chekout = rs.getBoolean("chekout");
                int singleRooms = rs.getInt("singleRooms");
                int doubleRooms = rs.getInt("doubleRooms");
                int tripleRooms = rs.getInt("tripleRooms");
                int quadrupleRooms = rs.getInt("quadrupleRooms");
                boolean confirmed = rs.getBoolean("confirmed");
                String comments = rs.getString("comments");
                String agencyUsername = rs.getString("username_agency");
                Reservation reservation = new Reservation(reservationId, arrivalDate, arrivalTime, departureDate, departureTime, submittedOn, checkin, chekout,
                        agencyUsername, singleRooms, doubleRooms, tripleRooms, quadrupleRooms, comments, confirmed);
                reservations.add(reservation);
            }
            stmt.close();
            rs.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
        return reservations;
    }// End of getAll

    public List<Reservation> getRecent(String username) throws Exception {
        Connection con = null;
        ResultSet rs = null;
        List<Reservation> reservations = new ArrayList<Reservation>();
        String sql = "SELECT * FROM reservation WHERE username_hotel = ? AND curdate() - submittedOn <= 3;";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {

                int reservationId = rs.getInt("reservationId");
                Date arrivalDate = rs.getDate("arrivalDate");
                String arrivalTime = rs.getString("arrivalTime");
                Date departureDate = rs.getDate("departureDate");
                String departureTime = rs.getString("departureTime");
                Date submittedOn = rs.getDate("submittedOn");
                boolean checkin = rs.getBoolean("checkin");
                boolean chekout = rs.getBoolean("chekout");
                int singleRooms = rs.getInt("singleRooms");
                int doubleRooms = rs.getInt("doubleRooms");
                int tripleRooms = rs.getInt("tripleRooms");
                int quadrupleRooms = rs.getInt("quadrupleRooms");
                boolean confirmed = rs.getBoolean("confirmed");
                String comments = rs.getString("comments");
                String agencyUsername = rs.getString("username_agency");
                Reservation reservation = new Reservation(reservationId, arrivalDate, arrivalTime, departureDate, departureTime, submittedOn, checkin, chekout,
                        agencyUsername, singleRooms, doubleRooms, tripleRooms, quadrupleRooms, comments, confirmed);
                reservations.add(reservation);
            }
            stmt.close();
            rs.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
        return reservations;
    }

    public void delete(int resId) throws Exception {
        Connection con = null;
        String sql = "DELETE FROM Reservation WHERE reservationId = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, resId);
            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }// End of delete
    

    public void edit(int resId) throws Exception {
        Connection con = null;
        String sql = "UPDATE Reservation SET arrivalDate = ?, arrivalTime = ?, departureDate = ?, departureTime = ? WHERE reservationId = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setDate(1, r.getArrivalDate());
            stmt.setString(2, r.getArrivalTime());
            stmt.setDate(3, r.getDepartureDate());
            stmt.setString(4, r.getDepartureTime());
            stmt.setInt(5, r.getReservationId());
            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }// End of edit

    public void checkIn(int resId) throws Exception {
        Connection con = null;
        String sql = "UPDATE Reservation SET checkin = true WHERE reservationId = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, resId);
            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }// End of checkIn

    public void checkOut(int resId) throws Exception {
        Connection con = null;
        String sql = "UPDATE Reservation SET chekout = true WHERE reservationId = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, resId);
            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }// End of checkOut


    public int insertReservation(Reservation reservation) {

        DB db = new DB();
		PreparedStatement stmt = null;;
        String sql = "INSERT INTO Reservation (arrivalDate, arrivalTime, departureDate, departureTime, singleRooms, doubleRooms, tripleRooms, quadrupleRooms, username_hotel, username_agency, submittedOn, comments)"
			+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            Connection con = db.getConnection ();

            stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setDate(1, reservation.getArrivalDate());
            stmt.setString(2, reservation.getArrivalTime());
            stmt.setDate(3, reservation.getDepartureDate());
			stmt.setString(4, reservation.getDepartureTime());
            stmt.setInt(5, reservation.getSingleRooms());
            stmt.setInt(6, reservation.getDoubleRooms());
            stmt.setInt(7, reservation.getTripleRooms());
            stmt.setInt(8, reservation.getQuadrupleRooms());
            stmt.setString(9, reservation.getHotelName());
            stmt.setString(10, reservation.getAgencyName());
            stmt.setDate(11,  Date.valueOf(LocalDate.now()));
            stmt.setString(12, reservation.getComments());
            
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating reservation failed, no rows affected.");
            }

            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            }
            else {
                throw new SQLException("Creating reservation failed, no ID obtained.");
            }
		} catch (Exception e) {
            e.printStackTrace();
            return -1;
        } finally {
            try {
                db.close();
            } catch (Exception e) {                

            }
        }
	} //end of insertReservation


    public void confirm(int resId) throws Exception {
        Connection con = null;
        String sql = "UPDATE Reservation SET confirmed = 1 WHERE reservationId = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, resId);
            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }

    }// End of confirm

    public double[] getPricePerRoomType (String hotelName) throws Exception {

        Connection con = null;
        ResultSet rs = null;
        double [] prices = new double [4];
        String sql = "SELECT priceSingle, priceDouble, priceTriple, priceQuadruple FROM Hotel WHERE username = ? ;";
        DB db = new DB();

        try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, hotelName);
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                double priceSingle = rs.getDouble("priceSingle");
                double priceDouble = rs.getDouble("priceDouble");
                double priceTriple = rs.getDouble("priceTriple");
                double priceQuadruple = rs.getDouble("priceQuadruple");

                prices[0] = priceSingle;
                prices[1] = priceDouble;
                prices[2] = priceTriple;
                prices[3] = priceQuadruple;

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

		return prices;
		
    } // End of getPricePerRoomType
    

    public List<Reservation> getReservationsPerAgency (String agencyName) throws Exception {

        Connection con = null;
        ResultSet rs = null;
        List<Reservation> reservationsOfAgencyList = new ArrayList<Reservation>();
        String sql = "SELECT reservationId, arrivalDate, arrivalTime, departureDate, departureTime, submittedOn, confirmed" 
                    + ", username_hotel, singleRooms, doubleRooms, tripleRooms, quadrupleRooms, comments "
                    + "FROM Reservation WHERE username_agency = ? ;";
        DB db = new DB();

        try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, agencyName);
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                int reservationId = rs.getInt("reservationId");
                Date arrivalDate = rs.getDate("arrivalDate");
                String arrivalTime = rs.getString("arrivalTime");
                Date departureDate = rs.getDate("departureDate");
                String departureTime = rs.getString("departureTime");
                Date submittedOn = rs.getDate("submittedOn");
                Boolean confirmed = rs.getBoolean("confirmed");
                String hotel_username = rs.getString("username_hotel");
                int singleRooms = rs.getInt("singleRooms");
                int doubleRooms = rs.getInt("doubleRooms");
                int tripleRooms = rs.getInt("tripleRooms");
                int quadrupleRooms = rs.getInt("quadrupleRooms");
                String comments = rs.getString("comments");

                Reservation reservation = new Reservation(reservationId, hotel_username, agencyName, arrivalDate, arrivalTime, 
                        departureDate, departureTime, submittedOn, singleRooms, doubleRooms, tripleRooms, 
                        quadrupleRooms, comments, confirmed);

                reservationsOfAgencyList.add(reservation);

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

		return reservationsOfAgencyList;
		
    } // End of getReservationsPerAgency

    public Reservation getById(int reservationId) {
        Connection con = null;
        Reservation reservation = null;
        ResultSet rs = null;
        DB db = new DB();
        String sql = "SELECT * FROM reservation WHERE reservationId = ?";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, reservationId);
            rs = stmt.executeQuery();

            if (rs.next()) {

                reservationId = rs.getInt("reservationId");
                Date arrivalDate = rs.getDate("arrivalDate");
                String arrivalTime = rs.getString("arrivalTime");
                Date departureDate = rs.getDate("departureDate");
                String departureTime = rs.getString("departureTime");
                Date submittedOn = rs.getDate("submittedOn");
                Boolean confirmed = rs.getBoolean("confirmed");
                String hotel_username = rs.getString("username_hotel");

                reservation = new Reservation(reservationId, arrivalDate, arrivalTime, departureDate, departureTime, submittedOn, confirmed, hotel_username);


            }

            stmt.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return reservation;
    }


    public Reservation getReservationOfAgencyById(int reservationId, String agencyUsername) {
        Connection con = null;
        Reservation reservation = null;
        ResultSet rs = null;
        DB db = new DB();
        String sql = "SELECT * FROM reservation WHERE reservationId = ? AND username_agency = ?";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, reservationId);
            stmt.setString(2, agencyUsername);
            rs = stmt.executeQuery();

            if (rs.next()) {

                reservationId = rs.getInt("reservationId");
                Date arrivalDate = rs.getDate("arrivalDate");
                String arrivalTime = rs.getString("arrivalTime");
                Date departureDate = rs.getDate("departureDate");
                String departureTime = rs.getString("departureTime");
                Date submittedOn = rs.getDate("submittedOn");
                Boolean confirmed = rs.getBoolean("confirmed");
                String hotel_username = rs.getString("username_hotel");
                int singleRooms = rs.getInt("singleRooms");
                int doubleRooms = rs.getInt("doubleRooms");
                int tripleRooms = rs.getInt("tripleRooms");
                int quadrupleRooms = rs.getInt("quadrupleRooms");
                String comments = rs.getString("comments");

                reservation = new Reservation(reservationId, hotel_username, agencyUsername, arrivalDate, arrivalTime, 
                        departureDate, departureTime, submittedOn, singleRooms, doubleRooms, tripleRooms, 
                        quadrupleRooms, comments, confirmed);

            }

            stmt.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return reservation;
    }

    public Reservation getReservationOfHotelById(int reservationId, String hotelUsername) {
        Connection con = null;
        Reservation reservation = null;
        ResultSet rs = null;
        DB db = new DB();
        String sql = "SELECT * FROM reservation WHERE reservationId = ? AND username_hotel = ?";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, reservationId);
            stmt.setString(2, hotelUsername);
            rs = stmt.executeQuery();

            if (rs.next()) {

                reservationId = rs.getInt("reservationId");
                Date arrivalDate = rs.getDate("arrivalDate");
                String arrivalTime = rs.getString("arrivalTime");
                Date departureDate = rs.getDate("departureDate");
                String departureTime = rs.getString("departureTime");
                Date submittedOn = rs.getDate("submittedOn");
                Boolean confirmed = rs.getBoolean("confirmed");
                String agency_username = rs.getString("username_agency");
                int singleRooms = rs.getInt("singleRooms");
                int doubleRooms = rs.getInt("doubleRooms");
                int tripleRooms = rs.getInt("tripleRooms");
                int quadrupleRooms = rs.getInt("quadrupleRooms");
                String comments = rs.getString("comments");

                reservation = new Reservation(reservationId, hotelUsername, agency_username, arrivalDate, arrivalTime, 
                        departureDate, departureTime, submittedOn, singleRooms, doubleRooms, tripleRooms, 
                        quadrupleRooms, comments, confirmed);

            }

            stmt.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return reservation;
    }
}
