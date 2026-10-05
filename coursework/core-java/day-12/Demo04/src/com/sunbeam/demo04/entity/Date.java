package com.sunbeam.demo04.entity;

import com.sunbeam.demo04.exceptions.InvaliDateException;

import java.util.Scanner;

public class Date {
    private int day;
    private int month;
    private int year;

    public Date(){
    }

    public Date(int day, int month, int year) {
        this.day = day;
        this.month = month;
        this.year = year;
    }

    public void accept(Scanner sc) throws InvaliDateException{
        System.out.print("Enter the day - ");
        int day = sc.nextInt();
        if(day<0 || day>31)
            throw new InvaliDateException("Day is invalid");
        this.day = day;
        System.out.print("Enter the month - ");
        month = sc.nextInt();
        System.out.print("Enter the year - ");
        year = sc.nextInt();
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @Override
    public String toString() {
        return day + "/" + month + "/" + year;
    }
}
