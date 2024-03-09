/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.afazeacbs.dao;

import com.mycompany.afazeacbs.model.User;
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
public class registerDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/afazeaconfinement";
    private String username = "root";
    private String password = "";

    private static final String INSERT_USER = "INSERT INTO user (fName, lName, pNo, email, password, address, city, postcode, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?); ";
    private static final String SELECT_ALL_USER = "SELECT * FROM user;";
    private static final String SELECT_USERS_BY_USERID = "SELECT * FROM user WHERE userId = ?;";
    private static final String UPDATE_USER = "UPDATE user set fName = ?, lName = ?, pNo = ?, email = ?, password = ?, address = ?, city = ?, postcode = ?, state = ? WHERE userId = ?;";
    private static final String DELETE_USER = "DELETE from user WHERE userId = ?;";

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
    //CRUD operations...

    //Create User record
    public void insertUser(User user) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)) {
            preparedStatement.setString(1, user.getfName());
            preparedStatement.setString(2, user.getlName());
            preparedStatement.setString(3, user.getpNo());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getCity());
            preparedStatement.setString(8, user.getPostcode());
            preparedStatement.setString(9, user.getState());
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //retrieve all user records
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<User>();

        //Establish the connection
        try (Connection connection = getConnection(); //Create the prepared statement..
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER)) {

            //Execute the query..
            ResultSet rs = preparedStatement.executeQuery();

            //Fetch the user record and store it into user object..
            while (rs.next()) {
                int userID = rs.getInt("userId");
                String fName = rs.getString("fName");
                String lName = rs.getString("lName");
                String pNo = rs.getString("pNo");
                String email = rs.getString("email");
                String pssword = rs.getString("pNo");
                String address = rs.getString("address");
                String city = rs.getString("city");
                String postcode = rs.getString("postcode");
                String state = rs.getString("state");
                users.add(new User(userID, fName, lName, pNo, email, pssword, address, city, postcode, state));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    //Retrieve user by id..
    public User selectUserById(int userid) {
        User user = null; //initialize the subject object as null

        //Establish connection
        try {
            Connection connection = getConnection();
            //Prepared sttment
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_USERID);
            preparedStatement.setInt(1, userid);

            //Execute query
            ResultSet rs = preparedStatement.executeQuery();

            //Fetch the user record and store in user obj
            while (rs.next()) {
                int userID = rs.getInt("userId");
                String fName = rs.getString("fName");
                String lName = rs.getString("lName");
                String pNo = rs.getString("pNo");
                String email = rs.getString("email");
                String pssword = rs.getString("pNo");
                String address = rs.getString("address");
                String city = rs.getString("city");
                String postcode = rs.getString("postcode");
                String state = rs.getString("state");
                user = new User(userID, fName, lName, pNo, email, pssword, address, city, postcode, state);

            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return user;
    }
    //update user record
    public boolean updateUser(User user) throws SQLException{
        boolean recordUpdated = false;
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER);
            preparedStatement.setString(1, user.getfName());
            preparedStatement.setString(2, user.getlName());
            preparedStatement.setString(3, user.getpNo());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getCity());
            preparedStatement.setString(8, user.getPostcode());
            preparedStatement.setString(9, user.getState());
            preparedStatement.setInt(10, user.getUserId());
            recordUpdated = preparedStatement.executeUpdate() > 0;
            
        } catch (Exception e){
            e.printStackTrace();
        }
        return recordUpdated;
    }
    
    //Delete user record
    public boolean deleteUser(int userID) throws SQLException {
        boolean recordDeleted = false;
        
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER);
            preparedStatement.setInt(1, userID);
            recordDeleted = preparedStatement.executeUpdate() > 0;
        } catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("deleteUser => Value for recordUser = " + recordDeleted);
        return recordDeleted;
    }
}
