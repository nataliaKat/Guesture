package model;

public class Grouping {

    private int id;
    private Room room;
    private Reservation reservation;

    public Grouping(int id, Room room, Reservation reservation) {
        this.id = id;
        this.room = room;
        this.reservation = reservation;
    }

    public Grouping(Room room, Reservation reservation) {
        this.room = room;
        this.reservation = reservation;
    }

    public Grouping(Reservation reservation) {
        this.reservation = reservation;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Grouping)) return false;

        Grouping grouping = (Grouping) o;

        if (id != grouping.id) return false;
        if (room != null ? !room.equals(grouping.room) : grouping.room != null) return false;
        return reservation != null ? reservation.equals(grouping.reservation) : grouping.reservation == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (room != null ? room.hashCode() : 0);
        result = 31 * result + (reservation != null ? reservation.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Grouping{" +
                "id=" + id +
                ", room=" + room +
                ", reservation=" + reservation +
                '}';
    }
}
