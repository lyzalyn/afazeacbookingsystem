/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.afazeacbs.dao;

import com.mycompany.afazeacbs.model.Treatment;
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
public class treatmentDAO {
    
    private String jdbcURL = "jdbc:mysql://localhost:3306/afazeaconfinement";
    private String username = "root";
    private String password = "";

    private static final String INSERT_TREATMENT = "INSERT INTO treatment (treatmentName) VALUES (?);";
    private static final String SELECT_ALL_TREATMENT = "SELECT * FROM treatment;";
    private static final String SELECT_TREATMENT_BY_ID = "SELECT * FROM treatment WHERE treatmentId = ?;";
    private static final String UPDATE_TREATMENT = "UPDATE treatment set treatmentName = ? WHERE treatmentId = ?;";
    private static final String DELETE_TREATMENT = "DELETE from treatment WHERE treatmentId = ?;";

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
    
    public void insertTreatment(Treatment treatment) throws SQLException {
        try (Connection connection = getConnection(); 
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TREATMENT)) {
            preparedStatement.setString(1, treatment.getTreatmentName());

            //Execute the insert statement
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //retrieve all package records
    public List<Treatment> selectAllTreatment() {
        List<Treatment> treatment = new ArrayList<Treatment>();

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TREATMENT)) {

            //Execute the query..
            ResultSet rs = preparedStatement.executeQuery();

            //Fetch the record and store it into package object..
            while (rs.next()) {
                int treatmentId = rs.getInt("treatmentId");
                String treatmentName = rs.getString("treatmentName");
                treatment.add(new Treatment(treatmentId, treatmentName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return treatment;
    }

    //retrieve by id
    public Treatment selectTreatmentById(int treatmentid) {
        Treatment treatment = null;

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TREATMENT_BY_ID);
            preparedStatement.setInt(1, treatmentid);

            //Execute query
            ResultSet rs = preparedStatement.executeQuery();

            //Fetch the package record and store in package obj
            while (rs.next()) {
                int treatmentId = rs.getInt("treatmentId");
                String treatmentName = rs.getString("treatmentName");
                treatment = new Treatment(treatmentId, treatmentName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return treatment;
    }

    public boolean updateTreatment(Treatment treatment) throws SQLException {
        boolean recordUpdated = false;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TREATMENT);
            preparedStatement.setString(1, treatment.getTreatmentName());
            preparedStatement.setInt(2, treatment.getTreatmentId());
            recordUpdated = preparedStatement.executeUpdate() > 0;
            
        } catch(Exception e){
            e.printStackTrace();
        }
        System.out.println("updatePackage => Value for recordPackage = " + recordUpdated);
        return recordUpdated;
    }
    
    //Delete record
    public boolean deleteTreatment(int treatmentId) throws SQLException{
        boolean recordDeleted = false;
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_TREATMENT);
            preparedStatement.setInt(1, treatmentId);
            recordDeleted = preparedStatement.executeUpdate() > 0;
        } catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("deleteTreatment => Value for recordTreatment = " + recordDeleted);
        return recordDeleted;
    }


    
}
