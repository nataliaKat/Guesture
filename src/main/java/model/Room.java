package model;

public class Room {

    private int id;
    private int number;
    private String type;
    private int floor;
    private String hotelUsername;

    public Room() {
    }

    public Room(int id, int number, String type, int floor) {
        this.id = id;
        this.number = number;
        this.type = type;
        this.floor = floor;
    }

    public Room(int number, String type, int floor) {
        this.number = number;
        this.type = type;
        this.floor = floor;
    }

    public Room(int number, String type, int floor, String hotelUsername) {
        this.id = id;
        this.number = number;
        this.type = type;
        this.floor = floor;
        this.hotelUsername = hotelUsername;
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

    public String getHotelUsername() {
        return hotelUsername;
    }

    public void setHotelUsername(String hotelUsername) {
        this.hotelUsername = hotelUsername;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", number=" + number +
                ", type='" + type + '\'' +
                ", floor=" + floor +
                ", hotelUsername='" + hotelUsername + '\'' +
                '}';
    }
}
