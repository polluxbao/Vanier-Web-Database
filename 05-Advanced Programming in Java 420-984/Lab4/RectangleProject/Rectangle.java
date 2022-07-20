/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vanier.rectangleproject;

/**
 *
 * @author Administrator
 */
public class Rectangle {
    private double length;
    private double width;
    
    public Rectangle() {
        length = 0;
        width = 0;
    }
    
    public Rectangle(double l, double w) {
//        if(l >=0 ) length = l;
//        else length =0;
//        
//        if(w >= 0) width = w;
//        else width = 0;
        setDimension(l, w);
    }
    
    public void setDimension(double l, double w) {
        if(l >=0 ) length = l;
        else length =0;
        
        if(w >= 0) width = w;
        else width = 0;
    }
            
    public double perimeter() {
        return 2 * (length + width);
    }
    
    public double area() {
        return length * width;
    }
    
    public double getLength() {
        return length;
    }

    public double getWidth() {
        return width;
    }
    
    public String toString() {
        return "Length = " + length 
                + ", Width = " + width
                + ", Perimeter = " + perimeter() 
                + ", Area = " + area();
    }
}
