package model;

import java.util.Date;

public class Reservation {

    private int reservationId;
    private Date arrivalDate;
    private String arrivalTime;
    private Date departureDate;
    private String departureTime;
    private int numberOfPeople;
    private double totalCost;
    private Date submittedOn;
    private boolean checkedIn;
    private boolean checkedOut;

    public Reservation() {

    }

    public Reservation(int reservationId, Date arrivalDate, String arrivalTime, Date departureDate, String departureTime,
                       int numberOfPeople, double totalCost, Date submittedOn, boolean checkedIn, boolean checkedOut) {
        this.reservationId = reservationId;
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

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public Date getSubmittedOn() {
        return submittedOn;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Reservation that = (Reservation) o;

        if (reservationId != that.reservationId) return false;
        if (numberOfPeople != that.numberOfPeople) return false;
        if (Double.compare(that.totalCost, totalCost) != 0) return false;
        if (checkedIn != that.checkedIn) return false;
        if (checkedOut != that.checkedOut) return false;
        if (arrivalDate != null ? !arrivalDate.equals(that.arrivalDate) : that.arrivalDate != null) return false;
        if (arrivalTime != null ? !arrivalTime.equals(that.arrivalTime) : that.arrivalTime != null) return false;
        if (departureDate != null ? !departureDate.equals(that.departureDate) : that.departureDate != null)
            return false;
        if (departureTime != null ? !departureTime.equals(that.departureTime) : that.departureTime != null)
            return false;
        return submittedOn != null ? submittedOn.equals(that.submittedOn) : that.submittedOn == null;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = reservationId;
        result = 31 * result + (arrivalDate != null ? arrivalDate.hashCode() : 0);
        result = 31 * result + (arrivalTime != null ? arrivalTime.hashCode() : 0);
        result = 31 * result + (departureDate != null ? departureDate.hashCode() : 0);
        result = 31 * result + (departureTime != null ? departureTime.hashCode() : 0);
        result = 31 * result + numberOfPeople;
        temp = Double.doubleToLongBits(totalCost);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (submittedOn != null ? submittedOn.hashCode() : 0);
        result = 31 * result + (checkedIn ? 1 : 0);
        result = 31 * result + (checkedOut ? 1 : 0);
        return result;
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
                ", totalCost=" + totalCost +
                ", submittedOn=" + submittedOn +
                ", checkedIn=" + checkedIn +
                ", checkedOut=" + checkedOut +
                '}';
    }
}
