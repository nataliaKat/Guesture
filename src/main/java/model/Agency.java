package model;

import java.util.Date;

public class Agency extends User {

    private String name;
    private String telephone;
    private String mail;
    private String vatNumber;
    private Date registrationDate;
    private String username;

    public Agency(){

    }
    
    public Agency(String username, String password) {
        super(username, password);
    }

    public Agency( String username,String password, String name, String telephone, String mail, String vatNumber, Date registrationDate) {
        super(username, password);
        this.name = name;
        this.telephone = telephone;
        this.mail = mail;
        this.vatNumber = vatNumber;
        this.registrationDate = registrationDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getVatNumber() {
        return vatNumber;
    }

    public void setVatNumber(String vatNumber) {
        this.vatNumber = vatNumber;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
		this.username = username;
	}

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((mail == null) ? 0 : mail.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((registrationDate == null) ? 0 : registrationDate.hashCode());
        result = prime * result + ((telephone == null) ? 0 : telephone.hashCode());
        result = prime * result + ((username == null) ? 0 : username.hashCode());
        result = prime * result + ((vatNumber == null) ? 0 : vatNumber.hashCode());
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
        Agency other = (Agency) obj;
        if (mail == null) {
            if (other.mail != null)
                return false;
        } else if (!mail.equals(other.mail))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (registrationDate == null) {
            if (other.registrationDate != null)
                return false;
        } else if (!registrationDate.equals(other.registrationDate))
            return false;
        if (telephone == null) {
            if (other.telephone != null)
                return false;
        } else if (!telephone.equals(other.telephone))
            return false;
        if (username == null) {
            if (other.username != null)
                return false;
        } else if (!username.equals(other.username))
            return false;
        if (vatNumber == null) {
            if (other.vatNumber != null)
                return false;
        } else if (!vatNumber.equals(other.vatNumber))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Agency [mail=" + mail + ", name=" + name + ", registrationDate=" + registrationDate + ", telephone="
                + telephone + ", username=" + username + ", vatNumber=" + vatNumber + "]";
    }

    
    
}
