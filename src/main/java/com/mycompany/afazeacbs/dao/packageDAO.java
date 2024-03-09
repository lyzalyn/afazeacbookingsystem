/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.afazeacbs.dao;

import com.mycompany.afazeacbs.model.Packages;
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
public class packageDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/afazeaconfinement";
    private String username = "root";
    private String password = "";

    private static final String INSERT_PACKAGE = "INSERT INTO packages (packageName) VALUES (?);";
    private static final String SELECT_ALL_PACKAGE = "SELECT * FROM packages;";
    private static final String SELECT_PACKAGE_BY_ID = "SELECT * FROM packages WHERE packagesId = ?;";
    private static final String UPDATE_PACKAGE = "UPDATE packages set packageName = ? WHERE packagesId = ?;";
    private static final String DELETE_PACKAGE = "DELETE from packages WHERE packagesId = ?;";

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

    public void insertPackage(Packages packages) throws SQLException {
        try (Connection connection = getConnection(); 
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PACKAGE)) {
            preparedStatement.setString(1, packages.getPackageName());

            //Execute the insert statement
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //retrieve all package records
    public List<Packages> selectAllPackage() {
        List<Packages> packages = new ArrayList<Packages>();

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PACKAGE)) {

            //Execute the query..
            ResultSet rs = preparedStatement.executeQuery();

            //Fetch the record and store it into package object..
            while (rs.next()) {
                int packagesId = rs.getInt("packagesId");
                String packageName = rs.getString("packageName");
                packages.add(new Packages(packagesId, packageName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return packages;
    }

    //retrieve by id
    public Packages selectPackageById(int packageid) {
        Packages packages = null;

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PACKAGE_BY_ID);
            preparedStatement.setInt(1, packageid);

            //Execute query
            ResultSet rs = preparedStatement.executeQuery();

            //Fetch the package record and store in package obj
            while (rs.next()) {
                int packagesId = rs.getInt("packagesId");
                String packageName = rs.getString("packageName");
                packages = new Packages(packagesId, packageName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return packages;
    }

    public boolean updatePackage(Packages packages) throws SQLException {
        boolean recordUpdated = false;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PACKAGE);
            preparedStatement.setString(1, packages.getPackageName());
            preparedStatement.setInt(2, packages.getPackagesId());
            recordUpdated = preparedStatement.executeUpdate() > 0;
            
        } catch(Exception e){
            e.printStackTrace();
        }
        System.out.println("updatePackage => Value for recordPackage = " + recordUpdated);
        return recordUpdated;
    }
    
    //Delete record
    public boolean deletePackage(int packagesId) throws SQLException{
        boolean recordDeleted = false;
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PACKAGE);
            preparedStatement.setInt(1, packagesId);
            recordDeleted = preparedStatement.executeUpdate() > 0;
        } catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("deletePackage => Value for recordPackage = " + recordDeleted);
        return recordDeleted;
    }

}
