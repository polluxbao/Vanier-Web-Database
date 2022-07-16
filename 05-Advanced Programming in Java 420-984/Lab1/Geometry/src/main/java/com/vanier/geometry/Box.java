/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vanier.geometry;

public class Box extends Rectangle{
    protected double height;
    
    public Box(){
        length = 0;
        width = 0;
        height = 0;
    }
    
    public Box(double l, double w, double h) {
        length = l;
        width = w;
        height = h;
    }
    
    public void setDimension(double l, double w, double h){
        if(l >= 0) length = l;
        else length = 0;
        
        if(w >= 0) width = w;
        else width = 0;
        
        if(h >= 0) height = h;
        else height = 0;
    }
    
    public String toString() {
        return "Length = " + length 
                + "; width = " + width 
                + "; height = "+ height;
    }
    public double getHeight() {
        return height;
    }
    
    public double perimeter() {
        return (width + length + height) * 4;
    }
    
    public double area() {
        return 2 * (length*width + length*height + width*height);
    }
    
    public double volumn() {
        return length*width*height;
    }
}
