package model;

import java.util.List;

public class Grouping {

    private int groupingId;
    private Room room;
    private Reservation reservation;
    List<GroupCustomer> groupCustomers;

    public Grouping(int groupingId, Room room, Reservation reservation) {
        this.groupingId = groupingId;
        this.room = room;
        this.reservation = reservation;
    }

    public Grouping(List<GroupCustomer> groupCustomers) {
        this.groupCustomers = groupCustomers;
    }

    public Grouping(Room room, Reservation reservation) {
        this.room = room;
        this.reservation = reservation;
    }

    public Grouping(Reservation reservation) {
        this.reservation = reservation;
    }

    public Grouping(int groupingId) {
        this.groupingId = groupingId;
    }

    public int getGroupingId() {
        return groupingId;
    }

    public void setGroupingId(int groupingId) {
        this.groupingId = groupingId;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }

    public List<GroupCustomer> getGroupCustomers() {
        return groupCustomers;
    }

    public void setGroupCustomers(List<GroupCustomer> groupCustomers) {
        this.groupCustomers = groupCustomers;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Grouping)) return false;

        Grouping grouping = (Grouping) o;

        if (groupingId != grouping.groupingId) return false;
        if (room != null ? !room.equals(grouping.room) : grouping.room != null) return false;
        if (reservation != null ? !reservation.equals(grouping.reservation) : grouping.reservation != null)
            return false;
        return groupCustomers != null ? groupCustomers.equals(grouping.groupCustomers) : grouping.groupCustomers == null;
    }

    @Override
    public int hashCode() {
        int result = groupingId;
        result = 31 * result + (room != null ? room.hashCode() : 0);
        result = 31 * result + (reservation != null ? reservation.hashCode() : 0);
        result = 31 * result + (groupCustomers != null ? groupCustomers.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Grouping{" +
                "id=" + groupingId +
                ", room=" + room +
                ", reservation=" + reservation +
                ", groupCustomers=" + groupCustomers +
                '}';
    }
}
