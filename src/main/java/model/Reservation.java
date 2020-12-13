package model;

import java.util.Date;

public class Reservation {

    private int reservationId;
    private Agency agency;
    private Date arrivalDate;
    private String arrivalTime;
    private Date departureDate;
    private String departureTime;
    private int numberOfPeople;
    private double totalCost;
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

    public Reservation() {

    }

    public Reservation(int reservationId, Agency agency, Date arrivalDate, String arrivalTime, Date departureDate,
            String departureTime, int numberOfPeople, double totalCost, Date submittedOn, boolean checkedIn,
            boolean checkedOut) {
        this.reservationId = reservationId;
        this.agency = agency;
        this.arrivalDate = arrivalDate;
        this.arrivalTime = arrivalTime;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.numberOfPeople = numberOfPeople;
        this.totalCost = totalCost;
        this.submittedOn = submittedOn;
        this.checkedIn = checkedIn;
        this.checkedOut = checkedOut;
    }

    public Reservation(int reservationId, Agency agency, Date arrivalDate, String arrivalTime, Date departureDate,
            String departureTime, double totalCost, Date submittedOn) {
        this.reservationId = reservationId;
        this.agency = agency;
        this.arrivalDate = arrivalDate;
        this.arrivalTime = arrivalTime;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.totalCost = totalCost;
        this.submittedOn = submittedOn;
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

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
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

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
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

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((agency == null) ? 0 : agency.hashCode());
        result = prime * result + ((arrivalDate == null) ? 0 : arrivalDate.hashCode());
        result = prime * result + ((arrivalTime == null) ? 0 : arrivalTime.hashCode());
        result = prime * result + (checkedIn ? 1231 : 1237);
        result = prime * result + (checkedOut ? 1231 : 1237);
        result = prime * result + ((departureDate == null) ? 0 : departureDate.hashCode());
        result = prime * result + ((departureTime == null) ? 0 : departureTime.hashCode());
        result = prime * result + numberOfPeople;
        result = prime * result + reservationId;
        result = prime * result + ((submittedOn == null) ? 0 : submittedOn.hashCode());
        long temp;
        temp = Double.doubleToLongBits(totalCost);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Reservation other = (Reservation) obj;
        if (agency == null) {
            if (other.agency != null)
                return false;
        } else if (!agency.equals(other.agency))
            return false;
        if (arrivalDate == null) {
            if (other.arrivalDate != null)
                return false;
        } else if (!arrivalDate.equals(other.arrivalDate))
            return false;
        if (arrivalTime == null) {
            if (other.arrivalTime != null)
                return false;
        } else if (!arrivalTime.equals(other.arrivalTime))
            return false;
        if (checkedIn != other.checkedIn)
            return false;
        if (checkedOut != other.checkedOut)
            return false;
        if (departureDate == null) {
            if (other.departureDate != null)
                return false;
        } else if (!departureDate.equals(other.departureDate))
            return false;
        if (departureTime == null) {
            if (other.departureTime != null)
                return false;
        } else if (!departureTime.equals(other.departureTime))
            return false;
        if (numberOfPeople != other.numberOfPeople)
            return false;
        if (reservationId != other.reservationId)
            return false;
        if (submittedOn == null) {
            if (other.submittedOn != null)
                return false;
        } else if (!submittedOn.equals(other.submittedOn))
            return false;
        if (Double.doubleToLongBits(totalCost) != Double.doubleToLongBits(other.totalCost))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Reservation [agency=" + agency + ", arrivalDate=" + arrivalDate + ", arrivalTime=" + arrivalTime
                + ", checkedIn=" + checkedIn + ", checkedOut=" + checkedOut + ", departureDate=" + departureDate
                + ", departureTime=" + departureTime + ", numberOfPeople=" + numberOfPeople + ", reservationId="
                + reservationId + ", submittedOn=" + submittedOn + ", totalCost=" + totalCost + "]";
    }

}
