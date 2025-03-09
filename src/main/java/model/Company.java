/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nkmq21
 */
public class Company {
    int companyID;
    String companyName;
    String companyAddress;
    String contactNumber;
    String companyEmail;

    public Company() {
    }

    public Company(int companyID, String companyName, String companyAddress, String contactNumber, String companyEmail) {
        this.companyID = companyID;
        this.companyName = companyName;
        this.companyAddress = companyAddress;
        this.contactNumber = contactNumber;
        this.companyEmail = companyEmail;
    }

    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    @Override
    public String toString() {
        return "Company{" + "companyID=" + companyID + ", companyName=" + companyName + ", companyAddress=" + companyAddress + ", contactNumber=" + contactNumber + ", companyEmail=" + companyEmail + '}'+"\n";
    }
    
    
    
}