package p3;

import java.util.Scanner;

public class Time {
    int hr;
    int min;

    // paramaterless constructor
    public Time(){
        System.out.println("Time constructor");
        hr = 10;
        min = 10;
    }

    // paramaterized constructor
    public Time(int h, int m){
        System.out.println("Time paramaterized constructor");
        hr = h;
        min = m;
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
