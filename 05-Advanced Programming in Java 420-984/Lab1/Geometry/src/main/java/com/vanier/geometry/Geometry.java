/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.vanier.geometry;

public class Geometry {

    public static void main(String[] args) {
        
        Rectangle myrectangle = new Rectangle(6, 2);
        System.out.println("----- A Rectangle -----");
        System.out.println("Width is "+myrectangle.getWidth());
        System.out.println("Area is "+myrectangle.area());
        System.out.println(myrectangle);
        
        Box mybox = new Box(6, 2, 3);
        System.out.println("----- A Box -----");
        System.out.println("Height is "+mybox.getHeight());
        System.out.println("Area is "+mybox.area());
        System.out.println("Volumn is "+mybox.volumn());
        System.out.println(mybox);
    }
}
