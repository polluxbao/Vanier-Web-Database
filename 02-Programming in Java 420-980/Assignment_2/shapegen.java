package test;

/*
File Name:    shapegen.java
Auther:       Qingjun Bao
Version:      1.0.0
Date:         2022 Jun 18
Description:  Shape generator
              Web and Database Vanier College

Question:	
write a shape generator program called Shape Factory. 

Firstly, the program needs to ask the user if he/she 
would like to print a reversed pyramid pattern or a 
number pattern. 

If the first option has been selected, the program 
should ask the user for the second time if he/she 
would like a reversed pyramid of stars (*) or at 
signs (@) and then print the shape.

If the user would like to see a number pattern, the 
other shape should be printed.

*/

import java.util.Scanner;

import javax.management.loading.PrivateClassLoader;


class Shape{
	public int n_pyramid = 5;
	
	private String[] optionsAvailable = {"r", "#", "q", "x"};
	private Scanner myScanner = new Scanner(System.in);
	
	Shape() {}
	
	public void welcome() {
		System.out.println("*** Welcome to Shape Factory! ***");
	}
	
	public void bye() {
		System.out.println("Bye !!");
	}
	
	public void wrong_input() {
		System.out.println("Wrong input! Please try again.");
		System.out.println();
	}
	
	public boolean validity(String str) {
		for(String s:optionsAvailable) {
			if(s.equals(str)) return true;
		}
		return false;
	}
	
	public String want_to() {
		String questionWant = "Do you want to print a reversed pyramid or a number pattern?"
					+ " (\"R\", \"#\" or \"x\" for exit)";

		System.out.println(questionWant);
		
		String inkey = myScanner.next();
		inkey = inkey.trim().substring(0, 1).toLowerCase();
		
		return inkey;
	}
	
	public String want_char() {
		String questionChar = "A reversed pyramid of stars or at signs?"
				+ " (\"*\" or \"@\")";
		System.out.println(questionChar);
		
		String inkey = myScanner.next();
		inkey = inkey.trim().substring(0, 1).toLowerCase();
		return inkey;
	}
	
	public void reversed_pyramid(String sign) {
		int i,j;
		int n = n_pyramid;
		int spaces; 
		for(i=0; i<n; i++) {
			spaces = i+1;
			System.out.printf(String.format("%" + spaces + "s", " "));
			for(j=0; j<n-i; j++) {
				System.out.printf(sign+" ");
			}
			System.out.printf("\n");
		}
		System.out.printf("\n");
	}
	
	public void number_pattern() {
		number_pattern(n_pyramid);
	}
	
	public void number_pattern(int n) {
		int i, j;
		int count=1;
		
		for(i=0; i<n; i++) {
			for(j=0; j<i+1; j++) {
				System.out.printf("%2d ",count++);
			}
			System.out.printf("\n");
		}
		System.out.printf("\n");
	}
}

public class shapegen {
public static void main(String[] args) {
	Shape shape = new Shape();
	String choice;
	boolean bye = false;
	shape.welcome();
	
	while(!bye) {
		choice = shape.want_to();
		
		switch (choice) {
		case "r":
			choice = shape.want_char();
			shape.reversed_pyramid(choice);
			break;
			
		case "#":
			shape.number_pattern();
			break;
	
		case "x":
			bye = true;
			break;
			
		default:
			if(!shape.validity(choice)) {
				shape.wrong_input();
			}
		}
	}
	
	shape.bye();
	
}
}