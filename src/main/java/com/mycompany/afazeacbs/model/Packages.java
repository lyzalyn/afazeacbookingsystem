/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.afazeacbs.model;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
public class Packages {
    
    private int packagesId;
    private String packageName;

    public Packages() {
    }
    
    

    public Packages(int packagesId, String packageName) {
        this.packagesId = packagesId;
        this.packageName = packageName;
    }

    public Packages(String packageName) {
        this.packageName = packageName;
    }
    
    public int getPackagesId() {
        return packagesId;
    }

    public void setPackagesId(int packagesId) {
        this.packagesId = packagesId;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    
    
    
}
