/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.afazeacbs.model;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
public class Treatment {
    
    private int treatmentId;
    private String treatmentName;

    public Treatment() {
    }

    public Treatment(String treatmentName) {
        this.treatmentName = treatmentName;
    }

    public Treatment(int treatmentId, String treatmentName) {
        this.treatmentId = treatmentId;
        this.treatmentName = treatmentName;
    }

    public int getTreatmentId() {
        return treatmentId;
    }

    public void setTreatmentId(int treatmentId) {
        this.treatmentId = treatmentId;
    }

    public String getTreatmentName() {
        return treatmentName;
    }

    public void setTreatmentName(String treatmentName) {
        this.treatmentName = treatmentName;
    }
    
    
    
    
}
