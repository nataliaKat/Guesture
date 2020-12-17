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
        AgencyDao adao = new AgencyDao();
        String sql = "SELECT reservationId, name, arrivalDate, arrivalTime, departureDate, departureTime, totalCost, submittedOn FROM Reservation, Agency WHERE Reservation.username_agency=Agency.username AND username_hotel = ?;";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                reservations.add(new Reservation(rs.getInt(1), adao.getByName(rs.getString(2)),
                        rs.getDate(3), rs.getString(4), rs.getDate(5),
                        rs.getString(6), rs.getDouble(7), rs.getDate(8)));
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

    public void edit(Reservation r) {
        Connection con = null;
        String sql = "UPDATE Reservation SET arrivalDate = ?, arrivalTime = ?, departureDate = ?, departureTime = ? WHERE reservationId = ?; ";
        DB db = new DB();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
//            stmt.setDate(1, r.getArrivalDate());
            stmt.setString(2, r.getArrivalTime());
//            stmt.setDate(3, r.getDepartureDate());
            stmt.setString(4, r.getDepartureTime());
            stmt.setInt(5, r.getReservationId());
            stmt.executeUpdate();

            stmt.close();

        } catch (Exception e) {
//            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }// End of edit

    public void checkIn(int resId) throws Exception {
        Connection con = null;
        String sql = "UPDATE Reservation SET checkin = 'TRUE' WHERE reservationId = ?; ";
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
        String sql = "UPDATE Reservation SET checkout = 'TRUE' WHERE reservationId = ?; ";
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


    public void insertReservation(Reservation reservation) {

        DB db = new DB();
		PreparedStatement stmt = null;;
        String sql = "INSERT INTO Reservation (arrivalDate, arrivalTime, departureDate, departureTime, singleRooms, doubleRooms, tripleRooms, quadrupleRooms, username_hotel, username_agency, submittedOn)"
			+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            System.out.println(reservation);
            Connection con = db.getConnection ();

            stmt = con.prepareStatement(sql);
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
            
            stmt.executeUpdate();
            
			stmt.close();
			con.close();

		//} catch (Exception e) {

		//	throw new Exception(e.getMessage());

		} catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                db.close();
            } catch (Exception e) {                

            }
        }
	} //end of insertReservation


    public void confirm(int resId) throws Exception {
        Connection con = null;
        String sql = "UPDATE Reservation SET confirmed = 'TRUE' WHERE reservationId = ?; ";
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
        String sql = "SELECT reservationId, arrivalDate, arrivalTime, departureDate, departureTime, submittedOn, confirmed, username_hotel FROM Reservation WHERE username_agency = ? ;";
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

                Reservation reservation = new Reservation(reservationId, arrivalDate, arrivalTime, departureDate, departureTime, submittedOn, confirmed, hotel_username);

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

}
