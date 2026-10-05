package p2;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Program02 {
    public static void div(int n, int d){
        System.out.println("Division - "+(n/d)); // BL
    }
    public static void main(String[] args) {
        try {
            Scanner sc = new Scanner(System.in);
            System.out.print("Enter the numerator - ");
            int n = sc.nextInt();
            System.out.print("Enter the denominator - ");
            int d = sc.nextInt();
            div(n, d);
        }catch (ArithmeticException e){
            System.out.println("Cannot divide by 0");
        }catch (InputMismatchException e){
            System.out.println("Input is incorrect");
        }


        System.out.println("Program completed successfully");
    }
}
