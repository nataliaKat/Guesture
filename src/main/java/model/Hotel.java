package model;

public class Hotel {

    private String username;
    private String name;
    private String address;
    private String phoneNumber;
    private String head;
    private String description;
    private Double priceSingle;
    private Double priceDouble;
    private Double priceTriple;
    private Double priceQuadruple;

    public Hotel() {
    }

    public Hotel(String username, String name, String address, String phoneNumber, String head, String description) {
        this.username = username;
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.head = head;
        this.description = description;
    }

    public Hotel(String username, String name, String address, String phoneNumber, String head, String description, Double priceSingle, Double priceDouble, Double priceTriple, Double priceQuadruple) {
        this.username = username;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public Double getPriceSingle() {
        return priceSingle;
    }

    public void setPriceSingle() {
        this.priceSingle = priceSingle;
    }

    public Double getPriceDouble() {
        return priceDouble;
    }

    public void setPriceDouble() {
        this.priceDouble = priceDouble;
    }

    public Double priceTriple() {
        return priceTriple;
    }

    public void setPriceTriple() {
        this.priceTriple = priceTriple
    }

    public Double getPriceQuadruple() {
        return priceQuadruple;
    }

    public void setPriceQuadruple() {
        this.priceQuadruple = priceQuadruple
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((address == null) ? 0 : address.hashCode());
        result = prime * result + ((description == null) ? 0 : description.hashCode());
        result = prime * result + ((head == null) ? 0 : head.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((phoneNumber == null) ? 0 : phoneNumber.hashCode());
        result = prime * result + ((username == null) ? 0 : username.hashCode());
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
        Hotel other = (Hotel) obj;
        if (address == null) {
            if (other.address != null)
                return false;
        } else if (!address.equals(other.address))
            return false;
        if (description == null) {
            if (other.description != null)
                return false;
        } else if (!description.equals(other.description))
            return false;
        if (head == null) {
            if (other.head != null)
                return false;
        } else if (!head.equals(other.head))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (phoneNumber == null) {
            if (other.phoneNumber != null)
                return false;
        } else if (!phoneNumber.equals(other.phoneNumber))
            return false;
        if (username == null) {
            if (other.username != null)
                return false;
        } else if (!username.equals(other.username))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Hotel [address=" + address + ", description=" + description + ", head=" + head + ", name=" + name
                + ", phoneNumber=" + phoneNumber + ", username=" + username + "]";
    }

}
