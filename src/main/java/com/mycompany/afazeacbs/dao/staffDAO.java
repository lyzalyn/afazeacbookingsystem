/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.afazeacbs.dao;

import com.mycompany.afazeacbs.model.Staff;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
public class staffDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/afazeaconfinement";
    private String username = "root";
    private String password = "";

    private static final String INSERT_STAFF = "INSERT INTO staff (sfName, slName, spNo, sEmail, sPassword, sAddress, sCity, sPostcode, sState , sRole) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ";
    private static final String SELECT_ALL_STAFF = "SELECT * FROM staff;";
    private static final String SELECT_STAFF_BY_STAFFID = "SELECT * FROM staff WHERE staffId = ?;";
    private static final String UPDATE_STAFF = "UPDATE staff set sfName = ?, slName = ?, spNo = ?, sEmail = ?, sPassword = ?, sAddress = ?, sCity = ?, sPostcode = ?, sState = ? , sRole = ? WHERE staffId = ?;";
    private static final String DELETE_STAFF = "DELETE from staff WHERE staffId = ?;";

    protected Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, username, password);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //CRUD operations
    //Create Staff record
    public void insertStaff(Staff staff) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STAFF)) {
            preparedStatement.setString(1, staff.getSfName());
            preparedStatement.setString(2, staff.getSlName());
            preparedStatement.setString(3, staff.getSpNo());
            preparedStatement.setString(4, staff.getsEmail());
            preparedStatement.setString(5, staff.getsPassword());
            preparedStatement.setString(6, staff.getsAddress());
            preparedStatement.setString(7, staff.getsCity());
            preparedStatement.setString(8, staff.getsPostcode());
            preparedStatement.setString(9, staff.getsState());
            preparedStatement.setString(10, staff.getsRole());
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //retrieve all user records

    public List<Staff> selectAllStaff() {
        List<Staff> staffs = new ArrayList<Staff>();

        //Establish the connection
        try (Connection connection = getConnection(); //Create the prepared statement..
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFF)) {

            //Execute the query..
            ResultSet rs = preparedStatement.executeQuery();

            //Fetch the user record and store it into user object..
            while (rs.next()) {
                int staffId = rs.getInt("staffId");
                String sfName = rs.getString("sfName");
                String slName = rs.getString("slName");
                String spNo = rs.getString("spNo");
                String sEmail = rs.getString("sEmail");
                String sPassword = rs.getString("sPassword");
                String sAddress = rs.getString("sAddress");
                String sCity = rs.getString("sCity");
                String sPostcode = rs.getString("sPostcode");
                String sState = rs.getString("sState");
                String sRole = rs.getString("sRole");
                staffs.add(new Staff(staffId, sfName, slName, spNo, sEmail, sPassword, sAddress, sCity, sPostcode, sState, sRole));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffs;
    }

    //Retrieve user by id..
    public Staff selectStaffById(int staffid) {
        Staff staff = null; //initialize the subject object as null

        //Establish connection
        try {
            Connection connection = getConnection();
            //Prepared sttment
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STAFF_BY_STAFFID);
            preparedStatement.setInt(1, staffid);

            //Execute query
            ResultSet rs = preparedStatement.executeQuery();

            //Fetch the user record and store in user obj
            while (rs.next()) {
                int staffId = rs.getInt("staffId");
                String sfName = rs.getString("sfName");
                String slName = rs.getString("slName");
                String spNo = rs.getString("spNo");
                String sEmail = rs.getString("sEmail");
                String sPassword = rs.getString("sPassword");
                String sAddress = rs.getString("sAddress");
                String sCity = rs.getString("sCity");
                String sPostcode = rs.getString("sPostcode");
                String sState = rs.getString("sState");
                String sRole = rs.getString("sRole");
                staff = new Staff(staffId, sfName, slName, spNo, sEmail, sPassword, sAddress, sCity, sPostcode, sState, sRole);

            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return staff;
    }
    //update staff record

    public boolean updateStaff(Staff staff) throws SQLException {
        boolean recordUpdated = false;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STAFF);
            preparedStatement.setString(1, staff.getSfName());
            preparedStatement.setString(2, staff.getSlName());
            preparedStatement.setString(3, staff.getSpNo());
            preparedStatement.setString(4, staff.getsEmail());
            preparedStatement.setString(5, staff.getsPassword());
            preparedStatement.setString(6, staff.getsAddress());
            preparedStatement.setString(7, staff.getsCity());
            preparedStatement.setString(8, staff.getsPostcode());
            preparedStatement.setString(9, staff.getsState());
            preparedStatement.setString(10, staff.getsRole());
            preparedStatement.setInt(11, staff.getStaffId());
            recordUpdated = preparedStatement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return recordUpdated;
    }
    //Delete user record

    public boolean deleteStaff(int staffID) throws SQLException {
        boolean recordDeleted = false;

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_STAFF);
            preparedStatement.setInt(1, staffID);
            recordDeleted = preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("deleteStaff => Value for recordStaff = " + recordDeleted);
        return recordDeleted;
    }
}
