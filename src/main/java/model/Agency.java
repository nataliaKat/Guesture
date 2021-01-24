package model;

import java.sql.Date;

public class Agency extends User {

    private String name;
    private String telephone;
    private String mail;
    private String vatNumber;
    private Date registrationDate;

    public Agency(){

    }
    
    public Agency(String username, String password) {
        super(username, password);
    }

    public Agency( String username,String password, String name, String telephone, String mail, String vatNumber) {
        super(username, password);
        this.name = name;
        this.telephone = telephone;
        this.mail = mail;
        this.vatNumber = vatNumber;
    }

    public Agency(String name, String telephone, String mail, String vatNumber, Date registrationDate, String username) {
        super(username);
        this.name = name;
        this.telephone = telephone;
        this.mail = mail;
        this.vatNumber = vatNumber;
        this.registrationDate = registrationDate;
    }

    public Agency(String username, String password, String name, String telephone, String mail, String vatNumber, Date registrationDate) {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Agency)) return false;
        if (!super.equals(o)) return false;

        Agency agency = (Agency) o;

        if (name != null ? !name.equals(agency.name) : agency.name != null) return false;
        if (telephone != null ? !telephone.equals(agency.telephone) : agency.telephone != null) return false;
        if (mail != null ? !mail.equals(agency.mail) : agency.mail != null) return false;
        if (vatNumber != null ? !vatNumber.equals(agency.vatNumber) : agency.vatNumber != null) return false;
        return registrationDate != null ? registrationDate.equals(agency.registrationDate) : agency.registrationDate == null;
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (telephone != null ? telephone.hashCode() : 0);
        result = 31 * result + (mail != null ? mail.hashCode() : 0);
        result = 31 * result + (vatNumber != null ? vatNumber.hashCode() : 0);
        result = 31 * result + (registrationDate != null ? registrationDate.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Agency{" +
                "name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", mail='" + mail + '\'' +
                ", vatNumber='" + vatNumber + '\'' +
                ", registrationDate=" + registrationDate +
                '}';
    }
}
