package com.sunbeam.demo04.entity;

import com.sunbeam.demo04.exceptions.InvaliDateException;

import java.util.Scanner;

public class Person {
    private String name;
    private Date dob;

    public Person(){
        this("",new Date());
    }

    public Person(String name, Date dob) {
        this.name = name;
        this.dob = dob;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public void accept(Scanner sc) throws Exception {
        System.out.print("Enter the name - ");
        name = sc.next();
        System.out.println("Enter the date of birth - ");
        dob.accept(sc);
    }

    public void display(){
        System.out.println("Name - "+name);
        System.out.println("Date of Birth - "+dob);
    }
}
