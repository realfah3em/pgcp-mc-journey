package p1;

import java.util.Scanner;

public class Program {
    public static int menu(Scanner sc){
        int choice;
        System.out.println("0. EXIT");
        System.out.println("1. ADD");
        System.out.println("2. DISPLAY");
        System.out.println("3. SORT");
        System.out.println("4. DELETE");
        System.out.println("5. UPDATE");
        System.out.println("6. DEPARTWISE_LIST");
        System.out.print("Enter your choice - ");
        return sc.nextInt();
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int choice;
        while ((choice=menu(sc))!=0){
            switch (choice){
                case 1:
                    break;

                case 2:
                    break;

                case 3:
                    break;

                case 4:
                    break;

                case 5:
                    break;

                case 6:
                    break;

            }
        }

    }
}
