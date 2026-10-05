package com.sunbeam.demo04.entity;

import com.sunbeam.demo04.exceptions.EmployeeException;
import com.sunbeam.demo04.exceptions.InvaliDateException;

import java.util.Objects;
import java.util.Scanner;

public class Employee extends Person{
    private int empid;
    private double salary;

    public int getEmpid() {
        return empid;
    }

    public void setEmpid(int empid) {
        this.empid = empid;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Employee(){
    }

    public Employee(int empid){
        this.empid = empid;
    }

    public Employee(String name, Date dob, int empid, double salary) {
        super(name, dob);
        this.empid = empid;
        this.salary = salary;
    }

    @Override
    public void accept(Scanner sc) throws Exception {
        System.out.print("Enter the empid - ");
        empid = sc.nextInt();

        super.accept(sc);

        System.out.print("Enter the salary - ");
        double salary = sc.nextDouble();
        if(salary<0)
            throw new EmployeeException("Salary cannot be less than 0");
        this.salary = salary;
    }

    @Override
    public void display() {
        System.out.println("Empid - "+empid);
        super.display();
        System.out.println("Salary - "+salary);
    }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Employee employee)) return false;
        return empid == employee.empid;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(empid);
    }
}
