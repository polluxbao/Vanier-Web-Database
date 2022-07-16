/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vanier.sportproject;

/**
 *
 * @author Administrator
 */
public class OlympicSport extends Sport{
    private double cost_pro;

    public OlympicSport(String n, double numberHour, int numberWeek, double costPro){
        setName(n);
        setNumberHour(numberHour);
        setNumberWeek(numberWeek);
        cost_pro = costPro;
    }
    
    public double getCostPro() {
        return cost_pro;
    }
    
    public double CalculateCostTraining() {
        cost_training = cost_hour 
                * getNumberHour() 
                * getNumberWeek()
                + cost_pro;
        return cost_training;
    }
    
    public double CalculateCostTraining(double costHour) {
        cost_hour = costHour;
        cost_training = cost_hour 
                * getNumberHour() 
                * getNumberWeek()
                + cost_pro;
        return cost_training;
    }
    
    public String toString() {
        return getName() + "//"
        + String.format("%.2f", getNumberHour()) + "//"
        + String.format("%d", getNumberWeek()) + "//"
        + String.format("%.2f$", cost_hour) + "//"
        + String.format("%.2f$", cost_pro);
    }
}
