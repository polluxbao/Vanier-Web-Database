/*
	File Name:    Vroom.java
	Auther:       Qingjun Bao
	Version:      1.1.0
	Date:         2022 Jun 12
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
import java.lang.Math;


class Car{
	private Map<Integer, String> carName = new HashMap<>();
	private Map<Integer, Integer> carPrice = new HashMap<>();
	private int carSum;
	Scanner myScanner = new Scanner(System.in);
	
	Car(){
		carName.put(1, "Toyota");
		carName.put(2, "Ford");
		carName.put(3, "Ferrari");
		
		carPrice.put(1, 12000);
		carPrice.put(2, 25000);
		carPrice.put(3, 100000);
		
		carSum = carName.size();
	}
	
	private String covPrice(int p) {
		if(p<1000) {
			return String.valueOf(p);
		} else {
			return String.valueOf(p/1000)+"K";
		}
	}
	
	public int totalCars() {
		return carName.size();
	}
	
	public void available() {
		for(int i=1;i<=carSum;i++) {
			System.out.printf("%d- %s, %s\n",
					i, carName.get(i), covPrice(carPrice.get(i)));
		}
	}
	
	public int whichWant() {
		System.out.println("Which one do you want?");
		int inkey = myScanner.nextInt();
		if(inkey<=0 || inkey>carSum) {
			System.out.println("Oops! We don't have that option!");
			return 0;			
		}
		return inkey;
	}
	
	public String getCar(int num) {
		if(num>0 && num<=carSum) {
			return carName.get(num);
		}
		return "Nothing";
	}
}

class Agency{
	Scanner myScanner = new Scanner(System.in);

	Agency() {
		System.out.println("*** Welcome to Vroom! ***");
	}
	
	public void bye() {
		System.out.println("Bye !!");	
	}
	
	public void no_service() {
		System.out.println("You didn't enter B or R and we don't offer any other services!");
	}
	
	public String chose_buy_rent() {
		String result;
		
		System.out.println("Buy or rent a car? Enter B for buying, R for renting.");
		String inkey = myScanner.next().toLowerCase();
		
		switch (inkey) {
		case "b":
			result = "buy";
			break;

		case "r":
			result = "rent";
			break;

		default:
			result = "other";
			break;
		}
		return result;
	}
	
	public void chose_buyCar() {
		System.out.println("So you're here to Buy!");
		Car car = new Car();
		car.available();
		int want=car.whichWant();
		if(want>0) {
			System.out.printf("You got the %s!\n", car.getCar(want));
		} 
		
	}

	public void days_rentCar() {
		System.out.println("So you're here to Rent!");
		System.out.println("For how many days do you need a car?");
		double totalRent = 0.0;
		int numOfdays = myScanner.nextInt();
		if(numOfdays>0) {
			totalRent = 3.5 * Math.pow(numOfdays,2) /2;
			System.out.printf("Total rent is : C$%1.2f\n",totalRent);
		} else {
			System.out.println("Number of days can't be zero or negative");
		}
	}
}

public class Vroom {
	
	public static void main(String args[]) {
		Agency agent = new Agency();
		
		String choice;
		
		choice = agent.chose_buy_rent();
		
		switch (choice) {
		case "buy":
			agent.chose_buyCar();
			break;

		case "rent":
			agent.days_rentCar();
			break;

		default:
			agent.no_service();
			break;
		}
		agent.bye();
	}
}
