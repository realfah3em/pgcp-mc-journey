package p7;

import java.util.Scanner;

public class Progarm {
    public static int menu(Scanner sc){
        int choice;
        System.out.println("0. EXIT");
        System.out.println("1. Add Student");
        System.out.println("2. Display all Students - (Natural Order)");
        System.out.println("3. Display all Students - (Name in ascending Order)");
        System.out.println("4. Display all Students - (Marks in Descending Order)");
        System.out.println("Enter your choice - ");
        choice = sc.nextInt();
        return  choice;
    }

    public static void main(String[] args) {
        // Student[] arr = new Student[10];
    }
}
