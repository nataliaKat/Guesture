package model;

import java.util.ArrayList;
import java.util.List ;
import model.Grouping;

public class GroupCustomer {

    private int customerId;
    private String name;
    private String surname;
    private String telephone;
    private String email;
    private String identityNumber;
    private Reservation reservation;
    private Grouping grouping;
    private List<Grouping> groupingList;

    public GroupCustomer() {
    }

    public GroupCustomer(int customerId, String name, String surname, String telephone, String email,
            String identityNumber) {
        this.customerId = customerId;
        this.name = name;
        this.surname = surname;
        this.telephone = telephone;
        this.email = email;
        this.identityNumber = identityNumber;
    }

    public GroupCustomer(int customerId, String name, String surname, String telephone, String email,
            String identityNumber, Reservation reservation) {
        this.customerId = customerId;
        this.name = name;
        this.surname = surname;
        this.telephone = telephone;
        this.email = email;
        this.identityNumber = identityNumber;
        this.reservation = reservation;
    }

    public GroupCustomer(String name, String surname, String telephone, String email, String identityNumber,
            Reservation reservation) {
        this.name = name;
        this.surname = surname;
        this.telephone = telephone;
        this.email = email;
        this.identityNumber = identityNumber;
        this.reservation = reservation;
    }

    public GroupCustomer(String name, String surname, String telephone, String email, String identityNumber,
            Grouping grouping) {
        this.name = name;
        this.surname = surname;
        this.telephone = telephone;
        this.email = email;
        this.identityNumber = identityNumber;
        this.grouping = grouping;
    }

    public GroupCustomer(String name, String surname, String telephone, String email, String identityNumber,
            List<Grouping> groupingList) {
        this.name = name;
        this.surname = surname;
        this.telephone = telephone;
        this.email = email;
        this.identityNumber = identityNumber;
        this.groupingList = groupingList;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIdentityNumber() {
        return identityNumber;
    }

    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
    }

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }

    public Grouping getGroupingList() {
        return groupingList;
    }

    public void setGroupingList(Grouping groupingList) {
        this.groupingList = groupingList;
    }

    public List<Grouping> getGrouping() {
        return grouping;
    }

    public void setGrouping(List<Grouping> grouping) {
        this.grouping = grouping;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + customerId;
        result = prime * result + ((email == null) ? 0 : email.hashCode());
        result = prime * result + ((grouping == null) ? 0 : grouping.hashCode());
        result = prime * result + ((identityNumber == null) ? 0 : identityNumber.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((reservation == null) ? 0 : reservation.hashCode());
        result = prime * result + ((surname == null) ? 0 : surname.hashCode());
        result = prime * result + ((telephone == null) ? 0 : telephone.hashCode());
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
        GroupCustomer other = (GroupCustomer) obj;
        if (customerId != other.customerId)
            return false;
        if (email == null) {
            if (other.email != null)
                return false;
        } else if (!email.equals(other.email))
            return false;
        if (grouping == null) {
            if (other.grouping != null)
                return false;
        } else if (!grouping.equals(other.grouping))
            return false;
        if (identityNumber == null) {
            if (other.identityNumber != null)
                return false;
        } else if (!identityNumber.equals(other.identityNumber))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (reservation == null) {
            if (other.reservation != null)
                return false;
        } else if (!reservation.equals(other.reservation))
            return false;
        if (surname == null) {
            if (other.surname != null)
                return false;
        } else if (!surname.equals(other.surname))
            return false;
        if (telephone == null) {
            if (other.telephone != null)
                return false;
        } else if (!telephone.equals(other.telephone))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "GroupCustomer [customerId=" + customerId + ", email=" + email + ", grouping=" + grouping
                + ", identityNumber=" + identityNumber + ", name=" + name + ", reservation=" + reservation
                + ", surname=" + surname + ", telephone=" + telephone + "]";
    }

}
