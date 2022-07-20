package com.vanier.rectangleproject;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class RectangleGUI extends JFrame implements ActionListener {
    //Create the four text fields
    JTextField lengthTF, widthTF, areaTF, perimeterTF;
    
    public RectangleGUI() {
        //Create the four labels
        JLabel lengthL = new JLabel("Enter the length: ", SwingConstants.RIGHT);
        JLabel widthL = new JLabel("Enter the width: ", SwingConstants.RIGHT);
        JLabel areaL = new JLabel("Areah: ", SwingConstants.RIGHT);
        JLabel perimeterL = new JLabel("Perimeter: ", SwingConstants.RIGHT);
        
        //Create the four text fields
        lengthTF = new JTextField(10);
        widthTF = new JTextField(10);
        areaTF = new JTextField(10);
        perimeterTF = new JTextField(10);
        
        //Create Calculate Button
        JButton calculateB = new JButton("Calculate");
        
        //Associate or register this listener with the corresponding JButton
        calculateB.addActionListener(this);

        //Create Exit Buttonthis
        JButton exitB = new JButton("Exit");
        //Associate or register this listener with the corresponding JButton
        exitB.addActionListener(this);

        //Set the title of the window
        setTitle("Area and Perieter of a Rectangle");

        //Get the container
        Container pane = getContentPane();

        //Set the layout
        pane.setLayout(new GridLayout(5, 2));

        //Place the components in the pane
        pane.add(lengthL);
        pane.add(lengthTF);
        pane.add(widthL);
        pane.add(widthTF);
        pane.add(areaL);
        pane.add(areaTF);
        pane.add(perimeterL);
        pane.add(perimeterTF);
        pane.add(calculateB);
        pane.add(exitB);
    
        //Set the size of the window and display it
        setSize(400, 300);
        setVisible(true);
    } // end of constructor RectangleGUI
    
    public void actionPerformed(ActionEvent e) {
        if(e.getActionCommand().equals("Calculate")) {
            double widthInput, lengthInput, areaOutput, perimeterOutput;
            
            Rectangle myrectangle1 = new Rectangle();
            
            lengthInput = Double.parseDouble(lengthTF.getText());
            widthInput = Double.parseDouble(widthTF.getText());
            
            myrectangle1.setDimension(lengthInput, widthInput);
            
            areaOutput = myrectangle1.area();
            perimeterOutput = myrectangle1.perimeter();
            
            areaTF.setText(areaOutput + "");
            perimeterTF.setText(perimeterOutput + "");
            
        } else if(e.getActionCommand().equals("Exit")) {
            System.exit(0);
        }  //End of ActionPerformed interface Method
    }
}
