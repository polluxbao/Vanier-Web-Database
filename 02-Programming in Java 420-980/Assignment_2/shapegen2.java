package test;

/*
File Name:    shapegen.java
Auther:       Qingjun Bao
Version:      2.0.0
Date:         2022 Jun 20
Description:  Shape generator 
		      Process-Oriented Version
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

public class shapegen2 {
public static void main(String[] args) {
	Scanner myScanner = new Scanner(System.in);
	String strInput;
	char charInputChoice, charSign;
	
	int n_pyramid = 5;
	
//	Welcome to Shape Factory
	System.out.println("*** Welcome to Shape Factory! ***");

	while(true) {
		System.out.println("Do you want to print a reversed pyramid or a number pattern?"
				+ " (\"R\", \"#\" or \"x\" for exit)");
		
		strInput = myScanner.nextLine().trim();
		charInputChoice = strInput.charAt(0);
		
		if(charInputChoice=='r' || charInputChoice=='R') {
//			To draw a reversed pyrimid
			System.out.println("A reversed pyramid of stars or at signs?"
					+ " (\"*\" or \"@\")");
			
			strInput = myScanner.nextLine();
			charSign = strInput.charAt(0);
			
			int n = n_pyramid;
			int spaces; 
			for(int i=0; i<n; i++) {
				spaces = i+1;
				System.out.printf(String.format("%" + spaces + "s", " "));
				for(int j=0; j<n-i; j++) {
					System.out.printf(charSign+" ");
				}
				System.out.printf("\n");
			}
			System.out.printf("\n");
			
		} else if (charInputChoice=='#') {
			int n = n_pyramid;
			int count=0;
			for(int i=0; i<n; i++) {
				for(int j=0; j<i+1; j++) {
					System.out.printf("%2d ",count++);
				}
				System.out.printf("\n");
			}
			System.out.printf("\n");
		} else if (charInputChoice=='x' || charInputChoice=='X') {
			break;
		} else {
			System.out.println("Wrong input! Please try again.");
			System.out.println();
		}
	}
	
	System.out.println("Bye !!");
}
}