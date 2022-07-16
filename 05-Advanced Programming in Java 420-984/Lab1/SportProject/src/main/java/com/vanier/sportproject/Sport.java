/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vanier.sportproject;

/**
 *
 * @author Administrator
 */
public class Sport {
    private String name;
    private double number_hour;
    private int number_week;
    
    public static double cost_hour;
    public double cost_training;
    
    public Sport() {
        name = "";
        number_hour = 0.00;
        number_week = 0;
    }
    public Sport(String n, double h, int w) {
        name = n;
        number_hour = h;
        number_week = w;
    }
    
    public boolean setName(String n) {
        try {
            name = n;
            return true;
        } catch(Exception e) {
            return false;
        }
    }
    
    public boolean setNumberHour(double hour) {
        try {
            number_hour = hour;
            return true;
        } catch(Exception e) {
            return false;
        }        
    }
    
    public boolean setNumberWeek(int week) {
        try {
            number_week = week;
            return true;
        } catch(Exception e) {
            return false;
        }        
    }    
    
    public String getName() {
        return name;
    }
    
    public double getNumberHour() {
        return number_hour;
    }
    
    public int getNumberWeek() {
        return number_week;
    }

    public double CalculateCostTraining() {
        cost_training = cost_hour * number_hour * number_week;
        return cost_training;
    }
    
    public double CalculateCostTraining(double costHour) {
        cost_hour = costHour;
        cost_training = cost_hour * number_hour * number_week;
        return cost_training;
    }
    
    public String toString() {
        return name + "//"
                + String.format("%.2f", number_hour) + "//"
                + String.format("%d", number_week) + "//"
                + String.format("%.2f$", cost_hour);
    }
    
}
