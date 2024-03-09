/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.afazeacbs.model;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
public class Staff {
    
    private int staffId;
    private String sfName;
    private String slName;
    private String spNo;
    private String sEmail;
    private String sPassword;
    private String sAddress;
    private String sCity;
    private String sPostcode;
    private String sState;
    private String sRole;
    
    
    //Default constructor 

    public Staff() {
    }

    public Staff(String sfName, String slName, String spNo, String sEmail, String sPassword, String sAddress, String sCity, String sPostcode, String sState, String sRole) {
        this.sfName = sfName;
        this.slName = slName;
        this.spNo = spNo;
        this.sEmail = sEmail;
        this.sPassword = sPassword;
        this.sAddress = sAddress;
        this.sCity = sCity;
        this.sPostcode = sPostcode;
        this.sState = sState;
        this.sRole = sRole;
    }

    public Staff(int staffId, String sfName, String slName, String spNo, String sEmail, String sPassword, String sAddress, String sCity, String sPostcode, String sState, String sRole) {
        this.staffId = staffId;
        this.sfName = sfName;
        this.slName = slName;
        this.spNo = spNo;
        this.sEmail = sEmail;
        this.sPassword = sPassword;
        this.sAddress = sAddress;
        this.sCity = sCity;
        this.sPostcode = sPostcode;
        this.sState = sState;
        this.sRole = sRole;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getSfName() {
        return sfName;
    }

    public void setSfName(String sfName) {
        this.sfName = sfName;
    }

    public String getSlName() {
        return slName;
    }

    public void setSlName(String slName) {
        this.slName = slName;
    }

    public String getSpNo() {
        return spNo;
    }

    public void setSpNo(String spNo) {
        this.spNo = spNo;
    }

    public String getsEmail() {
        return sEmail;
    }

    public void setsEmail(String sEmail) {
        this.sEmail = sEmail;
    }

    public String getsPassword() {
        return sPassword;
    }

    public void setsPassword(String sPassword) {
        this.sPassword = sPassword;
    }

    public String getsAddress() {
        return sAddress;
    }

    public void setsAddress(String sAddress) {
        this.sAddress = sAddress;
    }

    public String getsCity() {
        return sCity;
    }

    public void setsCity(String sCity) {
        this.sCity = sCity;
    }

    public String getsPostcode() {
        return sPostcode;
    }

    public void setsPostcode(String sPostcode) {
        this.sPostcode = sPostcode;
    }

    public String getsState() {
        return sState;
    }

    public void setsState(String sState) {
        this.sState = sState;
    }

    public String getsRole() {
        return sRole;
    }

    public void setsRole(String sRole) {
        this.sRole = sRole;
    }
    
    
    
    
}
