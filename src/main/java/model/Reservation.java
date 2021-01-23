package model;

import java.sql.Date;

public class Reservation {

    private int reservationId;
    private Date arrivalDate;
    private String arrivalTime;
    private Date departureDate;
    private String departureTime;
    private int numberOfPeople;
    private Date submittedOn;
    private boolean checkedIn;
    private boolean checkedOut;

    private String agencyName;
    private String hotelName;
    private int singleRooms;
    private int doubleRooms;
    private int tripleRooms;
    private int quadrupleRooms;
    private String comments;

    private boolean confirmed;

    public Reservation() {

    }

    public Reservation(int reservationId, Date arrivalDate, String arrivalTime, Date departureDate, String departureTime, Date submittedOn, boolean checkedIn, boolean checkedOut, String agencyName, int singleRooms, int doubleRooms, int tripleRooms, int quadrupleRooms, String comments, boolean confirmed) {
        this.reservationId = reservationId;
        this.arrivalDate = arrivalDate;
        this.arrivalTime = arrivalTime;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.submittedOn = submittedOn;
        this.checkedIn = checkedIn;
        this.checkedOut = checkedOut;
        this.agencyName = agencyName;
        this.singleRooms = singleRooms;
        this.doubleRooms = doubleRooms;
        this.tripleRooms = tripleRooms;
        this.quadrupleRooms = quadrupleRooms;
        this.comments = comments;
        this.confirmed = confirmed;
    }

    public Reservation(String hotelName, String agencyName, Date arrivalDate, String arrivalTime, Date departureDate,
                       String departureTime, int numberOfPeople, int singleRooms, int doubleRooms, int tripleRooms,
                       int quadrupleRooms, String comments) {
        this.hotelName = hotelName;
        this.agencyName = agencyName;
        this.arrivalDate = arrivalDate;
        this.arrivalTime = arrivalTime;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.numberOfPeople = numberOfPeople;
        this.singleRooms = singleRooms;
        this.doubleRooms = doubleRooms;
        this.tripleRooms = tripleRooms;
        this.quadrupleRooms = quadrupleRooms;
        this.comments = comments;

    }

    public Reservation (int reservationId, Date arrivalDate, String arrivalTime, Date departureDate,
    String departureTime, Date submittedOn, boolean confirmed, String hotelName, String comments) {

        this.reservationId = reservationId;
        this.arrivalDate = arrivalDate;
        this.arrivalTime = arrivalTime;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.submittedOn = submittedOn;
        this.confirmed = confirmed;
        this.hotelName = hotelName;
        this.comments = comments;

    }

    public Reservation(int reservationId, Date arrivalDate, String arrivalTime, Date departureDate, String departureTime, Date submittedOn, boolean confirmed, String hotel_username) {
        this.reservationId = reservationId;
        this.arrivalDate = arrivalDate;
        this.arrivalTime = arrivalTime;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.submittedOn = submittedOn;
        this.confirmed = confirmed;
        this.hotelName = hotel_username;
    }

    public Reservation(int reservationId, Date arrivalDate, String arrivalTime, Date departureDate, String departureTime, Date submittedOn, boolean checkedIn, boolean checkedOut, boolean confirmed, String agencyName) {
        this.reservationId = reservationId;
        this.arrivalDate = arrivalDate;
        this.arrivalTime = arrivalTime;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.submittedOn = submittedOn;
        this.checkedIn = checkedIn;
        this.checkedOut = checkedOut;
        this.agencyName = agencyName;
        this.confirmed = confirmed;
    }

    public Reservation(int reservationId, String hotelName, String agencyName, Date arrivalDate, String arrivalTime, Date departureDate,
                       String departureTime, Date submittedOn, int singleRooms, int doubleRooms, int tripleRooms,
                       int quadrupleRooms, String comments, Boolean confirmed) {
        this.reservationId = reservationId;
        this.hotelName = hotelName;
        this.agencyName = agencyName;
        this.arrivalDate = arrivalDate;
        this.arrivalTime = arrivalTime;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.submittedOn = submittedOn;
        this.singleRooms = singleRooms;
        this.doubleRooms = doubleRooms;
        this.tripleRooms = tripleRooms;
        this.quadrupleRooms = quadrupleRooms;
        this.comments = comments;
        this.confirmed = confirmed;

    }

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public Date getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public Date getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public Date getSubmittedOn() {
        return submittedOn;
    }

    public void setSingleRooms(int singleRooms) {
        this.singleRooms = singleRooms;
    }

    public int getSingleRooms() {
        return singleRooms;
    }

    public void setDoubleRooms(int doubleRooms) {
        this.doubleRooms = doubleRooms;
    }

    public int getDoubleRooms() {
        return doubleRooms;
    }

    public void setTripleRooms(int tripleRooms) {
        this.tripleRooms = tripleRooms;
    }

    public int getTripleRooms() {
        return tripleRooms;
    }

    public void setQuadrupleRooms(int quadrupleRooms) {
        this.quadrupleRooms = quadrupleRooms;
    }

    public int getQuadrupleRooms() {
        return quadrupleRooms;
    }

    public void setAgencyName(String agencyName) {
        this.agencyName = agencyName;
    }

    public String getAgencyName() {
        return agencyName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getComments() {
        return comments;
    }

    public void setSubmittedOn(Date submittedOn) {
        this.submittedOn = submittedOn;
    }

    public boolean isCheckedIn() {
        return checkedIn;
    }

    public void setCheckedIn(boolean checkedIn) {
        this.checkedIn = checkedIn;
    }

    public boolean isCheckedOut() {
        return checkedOut;
    }

    public void setCheckedOut(boolean checkedOut) {
        this.checkedOut = checkedOut;
    }

    public void setConfirmed(boolean confirmed) {
        this.confirmed = confirmed;
    }

    public boolean getConfirmed() {
        return confirmed;
    }


    @Override
    public String toString() {
        return "Reservation{" +
                "reservationId=" + reservationId +
                ", arrivalDate=" + arrivalDate +
                ", arrivalTime='" + arrivalTime + '\'' +
                ", departureDate=" + departureDate +
                ", departureTime='" + departureTime + '\'' +
                ", numberOfPeople=" + numberOfPeople +
                ", submittedOn=" + submittedOn +
                ", checkedIn=" + checkedIn +
                ", checkedOut=" + checkedOut +
                ", agencyName='" + agencyName + '\'' +
                ", hotelName='" + hotelName + '\'' +
                ", singleRooms=" + singleRooms +
                ", doubleRooms=" + doubleRooms +
                ", tripleRooms=" + tripleRooms +
                ", quadrupleRooms=" + quadrupleRooms +
                ", comments='" + comments + '\'' +
                ", confirmed=" + confirmed +
                '}';
    }
}
