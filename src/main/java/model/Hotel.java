package model;
import java.util.Arrays;

public class Hotel extends User {
    private String name;
    private String address;
    private String phoneNumber;
    private String head;
    private String description;
    private double priceSingle;
    private double priceDouble;
    private double priceTriple;
    private double priceQuadruple;
    private String photoUrl;
    private String[] services;
    
    

    public Hotel(){

    }
    
    public Hotel(String username, String password) {
        super(username,password);
    }

    public Hotel(String username, String name, String address, String phoneNumber, String head, String description) {
        super(username);
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.head = head;
        this.description = description;
    }

    public Hotel(String username, String password, String name, String address, String phoneNumber, String head, String description, Double priceSingle, Double priceDouble, Double priceTriple, Double priceQuadruple, String [] services, String photoUrl) {
        super(username,password);
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.head = head;
        this.description = description;
        this.priceSingle = priceSingle;
        this.priceDouble = priceDouble;
        this.priceTriple = priceTriple;
        this.priceQuadruple = priceQuadruple;
        this.services = services;
        this.photoUrl = photoUrl;
    }

    public Hotel(String username, String password, String name, String address, String phoneNumber, String head, String description, double priceSingle, double priceDouble, double priceTriple, double priceQuadruple) {
        super(username, password);
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.head = head;
        this.description = description;
        this.priceSingle = priceSingle;
        this.priceDouble = priceDouble;
        this.priceTriple = priceTriple;
        this.priceQuadruple = priceQuadruple;
    }

    public Hotel(String username, String name, String address, String phoneNumber, String head, String description, String photoUrl) {
        super(username);
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.head = head;
        this.description = description;
        this.photoUrl = photoUrl;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPriceSingle() {
        return priceSingle;
    }

    public void setPriceSingle() {
        this.priceSingle = priceSingle;
    }

    public double getPriceDouble() {
        return priceDouble;
    }

    public void setPriceDouble() {
        this.priceDouble = priceDouble;
    }

    public double getPriceTriple() {
        return priceTriple;
    }

    public void setPriceTriple() {
        this.priceTriple = priceTriple;
    }

    public double getPriceQuadruple() {
        return priceQuadruple;
    }

    public void setPriceQuadruple() {
        this.priceQuadruple = priceQuadruple;
    }

    public void setPriceSingle(double priceSingle) {
        this.priceSingle = priceSingle;
    }

    public void setPriceDouble(double priceDouble) {
        this.priceDouble = priceDouble;
    }

    public void setPriceTriple(double priceTriple) {
        this.priceTriple = priceTriple;
    }

    public void setPriceQuadruple(double priceQuadruple) {
        this.priceQuadruple = priceQuadruple;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public void setServices(String[] services) {
        this.services = services;
    }

    public String[] getServices() {
        return services;
    }

    public void setServices() {
        this.services = services;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Hotel)) return false;
        if (!super.equals(o)) return false;

        Hotel hotel = (Hotel) o;

        if (Double.compare(hotel.priceSingle, priceSingle) != 0) return false;
        if (Double.compare(hotel.priceDouble, priceDouble) != 0) return false;
        if (Double.compare(hotel.priceTriple, priceTriple) != 0) return false;
        if (Double.compare(hotel.priceQuadruple, priceQuadruple) != 0) return false;
        if (name != null ? !name.equals(hotel.name) : hotel.name != null) return false;
        if (address != null ? !address.equals(hotel.address) : hotel.address != null) return false;
        if (phoneNumber != null ? !phoneNumber.equals(hotel.phoneNumber) : hotel.phoneNumber != null) return false;
        if (head != null ? !head.equals(hotel.head) : hotel.head != null) return false;
        if (description != null ? !description.equals(hotel.description) : hotel.description != null) return false;
        if (photoUrl != null ? !photoUrl.equals(hotel.photoUrl) : hotel.photoUrl != null) return false;
        // Probably incorrect - comparing Object[] arrays with Arrays.equals
        return Arrays.equals(services, hotel.services);
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        long temp;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (phoneNumber != null ? phoneNumber.hashCode() : 0);
        result = 31 * result + (head != null ? head.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        temp = Double.doubleToLongBits(priceSingle);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(priceDouble);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(priceTriple);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(priceQuadruple);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (photoUrl != null ? photoUrl.hashCode() : 0);
        result = 31 * result + Arrays.hashCode(services);
        return result;
    }
}
