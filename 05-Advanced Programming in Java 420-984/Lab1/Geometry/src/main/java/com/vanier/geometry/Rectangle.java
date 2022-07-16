/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vanier.geometry;

public class Rectangle {
    protected double length;
    protected double width;
    
    public Rectangle() {
        length = 0;
        width = 0;
    }
    
    public Rectangle(double l, double w){
        setDimension(l, w);
    }
    
    public String toString() {
        return ("Length = " + length + "; width = " + width);
    }
    
    public void setDimension(double l, double w){
        if(l >= 0) length = l;
        else length = 0;
        
        if(w >= 0) width = w;
        else width = 0;
    }
    
    public double getWidth() {
        return width;
    }

    public double getLength() {
        return length;
    }
    
    public double perimeter() {
        return (width + length) * 2;
    }
    
    public double area() {
        return length*width;
    }
}

