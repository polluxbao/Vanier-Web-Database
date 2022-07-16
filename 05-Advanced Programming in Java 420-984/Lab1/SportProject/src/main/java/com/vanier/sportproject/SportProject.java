/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.vanier.sportproject;
import java.util.*;
/**
 * 
 * @author Qingjun Bao
 * @date   2022-06-30
 */
public class SportProject {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String name;
        double number_hour;
        int number_week;
        int cost_hour;
        
        Sport myPlayer = new Sport("Bob", 3, 15);
        Sport yourPlayer = new Sport("Irena", 4, 25);
        
        
        System.out.println("Enter the First Name, Number of Hour, and Cost of an hour of training:");
        System.out.println("The Sport Training Application Built with Object Oriented Programming (OOP)");
        
        System.out.printf("\nEnter Name: ");
        name = input.next();
        System.out.printf("Enter Number of Sport Training Hours per Week : ");
        number_hour = input.nextDouble();
        System.out.printf("Number of Weeks of Sport Training : ");
        number_week = input.nextInt();
        System.out.printf("The cost of Sport training per hour : ");
        cost_hour = input.nextInt();
        
        myPlayer.cost_hour = cost_hour;
        System.out.println();
        System.out.println("Info of myPlayer:");
        System.out.println("The Sport Training Information is : " + myPlayer);
        
        System.out.println();
        System.out.println("Info of yourPlayer:");
        System.out.println("The Sport Training Information is : " + yourPlayer);
        
        yourPlayer.setName(name);
        yourPlayer.setNumberHour(number_hour);
        yourPlayer.setNumberWeek(number_week);
        System.out.println();
        System.out.println("New Value of yourPlayer:");
        System.out.println("The Sport Training Information is : " + yourPlayer);

        OlympicSport olympicFaresPlayer = new OlympicSport("Fares", 2, 10, 6);
        System.out.println();
        System.out.println("Info of olympicFaresPlayer:");
        System.out.println("The Sport Training Information is : " + olympicFaresPlayer);
        
        OlympicSport olympicSarahPlayer = new OlympicSport("Sarah", 2, 18, 7);
        System.out.println();
        System.out.println("Info of olympicSarahPlayer:");
        System.out.println("The Sport Training Information is : " + olympicSarahPlayer);
        
        System.out.println();
        System.out.println("All Information about olympicFaresPlayer");
        System.out.println("Name:" + olympicFaresPlayer.getName());
        System.out.println("Number of Week:" + olympicFaresPlayer.getNumberWeek());
        System.out.println("Cost of hour:" + olympicFaresPlayer.getNumberHour());
        System.out.println("Cost Hour:" + olympicFaresPlayer.cost_hour);
        System.out.println("Professional Cost :" + olympicFaresPlayer.getCostPro());
        System.out.println("Cost of his Olympic Training: " + olympicFaresPlayer.CalculateCostTraining());
        
        System.out.println();
        System.out.println("All Information about olympicSarahPlayer");
        System.out.println("Name:" + olympicSarahPlayer.getName());
        System.out.println("Number of Week:" + olympicSarahPlayer.getNumberWeek());
        System.out.println("Cost of hour:" + olympicSarahPlayer.getNumberHour());
        System.out.println("Cost Hour:" + olympicSarahPlayer.cost_hour);
        System.out.println("Professional Cost :" + olympicSarahPlayer.getCostPro());
        System.out.println("Cost of his Olympic Training: " + olympicSarahPlayer.CalculateCostTraining());
        
    }
    
}
