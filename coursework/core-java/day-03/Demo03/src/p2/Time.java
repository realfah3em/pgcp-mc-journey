package p2;

import java.util.Scanner;

public class Time {
    int hr;
    int min;

    public void init(){
        hr = 10;
        min = 10;
    }

    public void acceptTime(){
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the hrs - ");
        this.hr = sc.nextInt();
        System.out.print("Enter the mins - ");
        min = sc.nextInt();
    }

    public void displayTime(){
    System.out.println("Time - "+hr+" : "+this.min);
    }

}
