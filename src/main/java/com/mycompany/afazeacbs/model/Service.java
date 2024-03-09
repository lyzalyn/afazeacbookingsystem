/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.afazeacbs.model;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
public class Service {
    
    private int serviceId;
    private String serviceName;
    private String serviceType;
    private String serviceDesc;
    private String serviceTime;
    private String serviceDays;
    private double servicePrice;

    public Service(String serviceName, String serviceType, String serviceDesc, String serviceTime, String serviceDays, double servicePrice) {
        this.serviceName = serviceName;
        this.serviceType = serviceType;
        this.serviceDesc = serviceDesc;
        this.serviceTime = serviceTime;
        this.serviceDays = serviceDays;
        this.servicePrice = servicePrice;
    }

    public Service(int serviceId, String serviceName, String serviceType, String serviceDesc, String serviceTime, String serviceDays, double servicePrice) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.serviceType = serviceType;
        this.serviceDesc = serviceDesc;
        this.serviceTime = serviceTime;
        this.serviceDays = serviceDays;
        this.servicePrice = servicePrice;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public String getServiceDesc() {
        return serviceDesc;
    }

    public void setServiceDesc(String serviceDesc) {
        this.serviceDesc = serviceDesc;
    }

    public String getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(String serviceTime) {
        this.serviceTime = serviceTime;
    }

    public String getServiceDays() {
        return serviceDays;
    }

    public void setServiceDays(String serviceDays) {
        this.serviceDays = serviceDays;
    }

    public double getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(double servicePrice) {
        this.servicePrice = servicePrice;
    }

    
    
    
    
}
