package p2;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Program03 {
    public static void div(int n, int d){
        System.out.println("Division - "+(n/d)); // BL
    }
    public static void main(String[] args) {
        try {
//            Scanner sc = new Scanner(System.in);
            Scanner sc = null;
            System.out.print("Enter the numerator - ");
            int n = sc.nextInt();
            System.out.print("Enter the denominator - ");
            int d = sc.nextInt();
            div(n, d);
        }catch (ArithmeticException | InputMismatchException e){
            System.out.println("Something went wrong");
        }


        System.out.println("Program completed successfully");
    }
}
