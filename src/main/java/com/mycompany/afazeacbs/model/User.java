/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.afazeacbs.model;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
public class User {
    
    private int userId;
    private String fName;
    private String lName;
    private String pNo;
    private String email;
    private String password;
    private String address;
    private String city;
    private String postcode;
    private String state;
    
  
    // Default constructor
    public User() {
    }

    // Parameterized constructor
    public User(int userId, String fName, String lName, String pNo, String email, String pssword, String address, String city, String postcode, String state) {
        this.userId = userId;
        this.fName = fName;
        this.lName = lName;
        this.pNo = pNo;
        this.email = email;
        this.password = pssword;
        this.address = address;
        this.city = city;
        this.postcode = postcode;
        this.state = state;
    }
  public User(String fName, String lName, String pNo, String email, String pssword, String address, String city, String postcode, String state) {
        this.fName = fName;
        this.lName = lName;
        this.pNo = pNo;
        this.email = email;
        this.password = pssword;
        this.address = address;
        this.city = city;
        this.postcode = postcode;
        this.state = state;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getpNo() {
        return pNo;
    }

    public void setpNo(String pNo) {
        this.pNo = pNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String pssword) {
        this.password = pssword;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    
}

    

