package p1;

import java.util.Scanner;

// abstract class - class that consists of abstract methods
// abstract methods can be declared only inside abstract classes
public abstract class Employee {
    int empid;
    double salary;

    Employee(){

    }

    public Employee(int empid, double salary) {
        this.empid = empid;
        this.salary = salary;
    }

    public void accept(Scanner sc){
        System.out.print("Enter the empid - ");
        empid = sc.nextInt();
        System.out.print("Enter the salary - ");
        salary = sc.nextDouble();
    }

    public void display(){
        System.out.println("Empid - "+empid);
        System.out.println("Salary - "+salary);
    }

    // abstract methods - 100% incomplete methods
    public abstract void calculateTotalSalary();
}
