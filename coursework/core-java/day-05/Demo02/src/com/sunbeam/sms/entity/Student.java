package com.sunbeam.sms.entity;

import com.sunbeam.sms.utils.ScannerClient;

import java.util.Scanner;

public class Student {
    private static int generateRollno = 0;
    private int rollno;
    private String name;
    private double percentage;

    {
        generateRollno++;
        this.rollno = generateRollno;
    }

    public Student() {
    }

    public Student( String name, double percentage) {
        this.name = name;
        this.percentage = percentage;
    }

    public void acceptStudent(){
        Scanner sc = ScannerClient.getInstance();
        System.out.print("Enter the name - ");
        name = sc.next();
        System.out.print("Enter the percentage - ");
        percentage = sc.nextDouble();
    }

    public void displayStudent(){
        System.out.println("Rollno - "+rollno);
        System.out.println("Name - "+name);
        System.out.println("Percentage - "+percentage);
        System.out.println("----------------------------");
    }
}
