package p3;

import java.util.Scanner;

public class Program02 {
    public static void div(int n, int d){
        System.out.println("Division - "+(n/d)); // BL
    }
    public static void main(String[] args) {
        // try-with-resource
        // it closes the resources automatically
        // after try block is executed(with or without exception)
        // only the resources that implements the interface Autoclosable
        // can be used inside try-with-resource
        try(Scanner sc = new Scanner(System.in);) {
            System.out.print("Enter the numerator - ");
            int n = sc.nextInt();
            System.out.print("Enter the denominator - ");
            int d = sc.nextInt();
            div(n, d);
        }

        System.out.println("Program completed successfully");
    }
}
