package com.vanier.conversiondialoguebox;

import java.util.Scanner;
import javax.swing.JOptionPane;


public class ConversionDialogueBox {
    static Scanner console = new Scanner(System.in);

    public static void main(String[] args) {
        String str;
        double Can_Cur;
        String Can_Curl;
        
        str = "The Currency Conversion";
        
        JOptionPane.showMessageDialog(null, str, "My First Dialogue Box",
                                JOptionPane.INFORMATION_MESSAGE);
        Can_Curl = JOptionPane.showInputDialog("Enter your Amount in Canaian" +
                                "Currency: $CAN and press OK");
    }
}
