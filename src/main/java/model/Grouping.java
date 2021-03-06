package model;

import java.util.List;

public class Grouping {

    private int groupingId;
    private int roomId;
    /* Had to add field due to Json construction */
    private Room room;
    private Reservation reservation;
    List<GroupCustomer> groupCustomers;

    public Grouping(int groupingId, int roomId, Room room, List<GroupCustomer> groupCustomers) {
        this.groupingId = groupingId;
        this.roomId = roomId;
        this.room = room;
        this.groupCustomers = groupCustomers;
    }

    public Grouping() {
    }

    public Grouping(int groupingId, int roomId) {
        this.groupingId = groupingId;
        this.roomId = roomId;
    }

    public Grouping(List<GroupCustomer> groupCustomers) {
        this.groupCustomers = groupCustomers;
    }

    public Grouping(int roomId, Reservation reservation) {
        this.roomId = roomId;
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

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
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

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Grouping)) return false;

        Grouping grouping = (Grouping) o;

        if (groupingId != grouping.groupingId) return false;
        if (roomId != grouping.roomId) return false;
        if (reservation != null ? !reservation.equals(grouping.reservation) : grouping.reservation != null)
            return false;
        return groupCustomers != null ? groupCustomers.equals(grouping.groupCustomers) : grouping.groupCustomers == null;
    }

    @Override
    public int hashCode() {
        int result = groupingId;
        result = 31 * result + roomId;
        result = 31 * result + (reservation != null ? reservation.hashCode() : 0);
        result = 31 * result + (groupCustomers != null ? groupCustomers.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Grouping{" +
                "groupingId=" + groupingId +
                ", roomId=" + roomId +
                ", reservation=" + reservation +
                ", groupCustomers=" + groupCustomers +
                '}';
    }
}
