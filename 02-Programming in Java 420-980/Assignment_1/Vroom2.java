package test;

/*
	File Name:    Vroom2.java
	Auther:       Qingjun Bao
	Version:      2.0.0
	Date:         2022 Jun 20
	Description:  Vroom Car Garage
	              Web and Database Vanier College
	
	Question:	
	Let’s write a program for a car agency called Vroom. 
	First, we have to see if the customer would like to
	buy or rent a car. 
	
	If the user wants to buy a car, the agency has three 
	different cars to offer. 
	A Toyota, a Ford, and a Ferrari. 
	The user can choose the car he/she wants and the program will end. 
	
	If the user wants to rent a car, he/she has to enter the number of 
	days he/she needs the car.

*/

import java.util.Scanner;
import java.util.*;
import java.awt.image.PixelInterleavedSampleModel;
import java.lang.Math;

public class Vroom2 {
	
	public static void main(String args[]) {
		
//		Welcome to Vroom
		System.out.println("*** Welcome to Vroom! ***");
		
//		Prompt the user to choose B for buying or R for renting
		System.out.println("Buy or rent a car? Enter B for buying, R for renting.");

		Scanner myScanner = new Scanner(System.in);
		
		String strInput = myScanner.nextLine();
		
		char charBuyRent = strInput.trim().charAt(0);
		
		if(charBuyRent == 'b' || charBuyRent == 'B') {
//			Selected want to Buy a Car
			System.out.println("So you're here to Buy!");
			System.out.println("We have three different cars available:");
			System.out.println("1- Toyota, 12K");
			System.out.println("2- Ford, 25K");
			System.out.println("3- Ferrari, 100K");
			System.out.println("Which one do you want?");
			
			int intCarNum = myScanner.nextInt();
			String carGot= "";
			
			switch (intCarNum) {
			case 1:
				carGot = "Toyota";
				break;
			case 2:
				carGot = "Ford";
				break;
			case 3:
				carGot = "Ferrari";
				break;
			default:
				System.out.println("Oops! We don't have that option!");
				break;
			}
			
			if(carGot!="") {
				System.out.println("You got the " + carGot);
			}
			
		} else if(charBuyRent == 'r' || charBuyRent == 'R') {
//			Selected want to Rent a Car
			System.out.println("So you're here to Rent!");
			System.out.println("For how many days do you need a car?");
			
			int intDaysNum = myScanner.nextInt();
			Double dbTotalRent;
			if(intDaysNum <= 0) {
				System.out.println("Number of days can't be zero or negative");
			} else {
				dbTotalRent = 3.5 * Math.pow(intDaysNum, 2) /2;
				System.out.println("Total rent is: C$"+String.format("%.2f", dbTotalRent));
			}

		} else {
//			Inputed other choice
			System.out.println("You didn't enter B or R and we don't offer any other services!");
		}
		
//		Leave the Vroom
		System.out.println("Bye !!");
	}
}
