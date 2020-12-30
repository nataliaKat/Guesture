package model;

public class Room {

    private int id;
    private int number;
    private String type;
    private int floor;
    private Hotel hotel;

    public Room() {
    }

    public Room(int id, int number, String type, int floor) {
        this.id = id;
        this.number = number;
        this.type = type;
        this.floor = floor;
    }

    public Room(int number, String type, int floor, Hotel hotel) {
        this.number = number;
        this.type = type;
        this.floor = floor;
        this.hotel = hotel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Room)) return false;

        Room room = (Room) o;

        if (id != room.id) return false;
        if (number != room.number) return false;
        if (floor != room.floor) return false;
        if (type != null ? !type.equals(room.type) : room.type != null) return false;
        return hotel != null ? hotel.equals(room.hotel) : room.hotel == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + number;
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + floor;
        result = 31 * result + (hotel != null ? hotel.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", number=" + number +
                ", type='" + type + '\'' +
                ", floor=" + floor +
                ", hotel=" + hotel +
                '}';
    }
}
