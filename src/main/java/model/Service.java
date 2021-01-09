package model;

public class Service {

    private int serviceId;
    private String name;
    private String hotelName;
    private String [] services;

    public Service() {

    }

    public Service (int serviceId, String name, String hotelName) {
        
        this.serviceId = serviceId;
        this.name = name;
        this.hotelName = hotelName;

    }

    public Service (String name, String hotelName) {
        this.name = name;
        this.hotelName = hotelName;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }


    
}