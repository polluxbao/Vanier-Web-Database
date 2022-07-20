package com.vanier.guisportproject;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class SportGInterface extends JFrame implements ActionListener {
    //Create the four text fields
    JTextField u_NameTF, u_Number_hourTF, u_Number_weekTF, u_CostHourTF, u_CostTF;
    
    public SportGInterface() {
        //Create the four labels
        JLabel u_Name = new JLabel("Enter Name: ", SwingConstants.RIGHT);
        JLabel u_Number_hour = new JLabel("Enter Number of Hours Per/Week: ", SwingConstants.RIGHT);
        JLabel u_Number_week = new JLabel("Enter Number of Weeks of ST: ", SwingConstants.RIGHT);
        JLabel u_CostHour = new JLabel("Enter The cost of ST per hour: ", SwingConstants.RIGHT);
        JLabel u_Cost = new JLabel("The Cost of ST(yourSport Object): ", SwingConstants.RIGHT);
        
        //Create the four text fields
        u_NameTF = new JTextField(10);
        u_Number_hourTF = new JTextField(10);
        u_Number_weekTF = new JTextField(10);
        u_CostHourTF = new JTextField(10);
        u_CostTF = new JTextField(10);
        
        //Create Calculate Button
        JButton calculateB = new JButton("Calculate");
        
        //Associate or register this listener with the corresponding JButton
        calculateB.addActionListener(this);

        //Create Exit Buttonthis
        JButton exitB = new JButton("Exit");
        //Associate or register this listener with the corresponding JButton
        exitB.addActionListener(this);

        //Set the title of the window
        setTitle("Sport Training Application");

        //Get the container
        Container pane = getContentPane();

        //Set the layout
        pane.setLayout(new GridLayout(6, 2));

        //Place the components in the pane
        pane.add(u_Name);
        pane.add(u_NameTF);
        pane.add(u_Number_hour);
        pane.add(u_Number_hourTF);
        pane.add(u_Number_week);
        pane.add(u_Number_weekTF);
        pane.add(u_CostHour);
        pane.add(u_CostHourTF);
        pane.add(u_Cost);
        pane.add(u_CostTF);      
        pane.add(calculateB);
        pane.add(exitB);
    
        //Set the size of the window and display it
        setSize(400, 300);
        setVisible(true);
    }
    
    public void actionPerformed(ActionEvent e) {
        if(e.getActionCommand().equals("Calculate")) {
            String u_NameInput;
            int u_Number_weekInput;
            double u_Number_hourInput, u_CostHourInput;
            double u_CostOutput;

            u_NameInput = u_NameTF.getText();
            u_Number_hourInput = Double.parseDouble(u_Number_hourTF.getText());
            u_Number_weekInput = Integer.parseInt(u_Number_weekTF.getText());
            u_CostHourInput = Double.parseDouble(u_CostHourTF.getText());
            Sport mysport1 = new Sport(u_NameInput,u_Number_hourInput,u_Number_weekInput);

            u_CostOutput = mysport1.CalculateCostTraining(u_CostHourInput);
            u_CostTF.setText(String.format("%.2f", u_CostOutput).toString() + "$");
            
        } else if(e.getActionCommand().equals("Exit")) {
            System.exit(0);
        }  //End of ActionPerformed interface Method
    }
}
