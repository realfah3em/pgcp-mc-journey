package p3;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Program01 {
    public static void div(int n, int d){
        System.out.println("Division - "+(n/d)); // BL
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
//            Scanner sc = null;

        try {
            System.out.print("Enter the numerator - ");
            int n = sc.nextInt();
            System.out.print("Enter the denominator - ");
            int d = sc.nextInt();
            div(n, d);
        }finally {
            // release the resources
            System.out.println("Inside Finally");
            sc.close();
        }


        System.out.println("Program completed successfully");
    }
}
