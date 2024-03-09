/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.afazeacbs.dao;

import com.mycompany.afazeacbs.model.Service;
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
public class serviceDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/afazeaconfinement";
    private String username = "root";
    private String password = "";

    private static final String INSERT_SERVICE = "INSERT INTO service (serviceName, serviceType,serviceDesc,serviceTime,serviceDays,servicePrice) VALUES (?,?,?,?,?,?);";
    private static final String SELECT_ALL_SERVICE = "SELECT * FROM service;";
    private static final String SELECT_SERVICE_BY_ID = "SELECT * FROM service WHERE serviceId = ?;";
    private static final String UPDATE_SERVICE = "UPDATE service set serviceName = ?, serviceType = ?, serviceDesc = ?, serviceTime = ?, serviceDays = ?, servicePrice = ? WHERE serviceId = ?;";
    private static final String DELETE_SERVICE = "DELETE from service WHERE serviceId = ?;";

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
    // Create Service record
public void insertService(Service service) throws SQLException {
    try (Connection connection = getConnection(); 
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SERVICE)) {
        preparedStatement.setString(1, service.getServiceName());
        preparedStatement.setString(2, service.getServiceType());
        preparedStatement.setString(3, service.getServiceDesc());
        preparedStatement.setString(4, service.getServiceTime());
        preparedStatement.setString(5, service.getServiceDays());
        preparedStatement.setDouble(6, service.getServicePrice());

        // Execute the insert statement
        preparedStatement.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}


    //retrieve all service records
    public List<Service> selectAllService() {
        List<Service> services = new ArrayList<Service>();

        try (Connection connection = getConnection(); 
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE)) {

            //Execute the query..
            ResultSet rs = preparedStatement.executeQuery();

            //Fetch the  record and store it into  service object..
            while (rs.next()) {
                int serviceId = rs.getInt("serviceId");
                String serviceName = rs.getString("serviceName");
                String serviceType = rs.getString("serviceType");
                String serviceDesc = rs.getString("serviceDesc");
                String serviceTime = rs.getString("serviceTime");
                String serviceDays = rs.getString("serviceDays");
                double servicePrice = rs.getDouble("servicePrice");
                services.add(new Service(serviceId, serviceName, serviceType, serviceDesc, serviceTime, serviceDays, servicePrice));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    //retrieve by id
    public Service selectServiceById(int serviceid) {
        Service service = null; //initialize subject object as null

        //Establish connection
        try {
            Connection connection = getConnection();
            //Prepared sttment
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SERVICE_BY_ID);
            preparedStatement.setInt(1, serviceid);

            //Execute query
            ResultSet rs = preparedStatement.executeQuery();

            //Fetch the service record and store in service obj
            while (rs.next()) {
                int serviceId = rs.getInt("serviceId");
                String serviceName = rs.getString("serviceName");
                String serviceType = rs.getString("serviceType");
                String serviceDesc = rs.getString("serviceDesc");
                String serviceTime = rs.getString("serviceTime");
                String serviceDays = rs.getString("serviceDays");
                double servicePrice = rs.getDouble("servicePrice");
                service = new Service(serviceId, serviceName, serviceType, serviceDesc, serviceTime, serviceDays, servicePrice);

            } 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return service;
    }

    //update service 
    public boolean updateService(Service service) throws SQLException {
        boolean recordUpdated = false;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SERVICE);
            preparedStatement.setString(1, service.getServiceName());
            preparedStatement.setString(2, service.getServiceType());
            preparedStatement.setString(3, service.getServiceDesc());
            preparedStatement.setString(4, service.getServiceTime());
            preparedStatement.setString(5, service.getServiceDays());
            preparedStatement.setDouble(6, service.getServicePrice());
            preparedStatement.setInt(7, service.getServiceId());
            recordUpdated = preparedStatement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();

        }
          System.out.println("updateService => Value for recordService = " + recordUpdated);
        return recordUpdated;
    }

    //Delete record
    public boolean deleteService(int serviceId) throws SQLException {
        boolean recordDeleted = false;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SERVICE);
            preparedStatement.setInt(1, serviceId);
            recordDeleted = preparedStatement.executeUpdate() > 0;
        } catch (Exception e){
            e.printStackTrace();
        }
             System.out.println("deleteService => Value for recordService = " + recordDeleted);
        return recordDeleted;
    }
}
