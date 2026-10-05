package p1;

import java.util.Scanner;

public class Employee extends Person{
    int empid;
    double salary;
    Employee(){
        System.out.println("Employee()");
    }

    public Employee(int empid, String name, String mobile, double salary) {
        super(name,mobile);// super statement
        System.out.println("Employee(int,String,String,double)");
        this.empid = empid;
        this.salary = salary;
    }


    public void acceptEmployee(Scanner sc){
        System.out.print("Enter the empid - ");
        empid = sc.nextInt();

        this.acceptPerson(sc);

        System.out.print("Enter the salary - ");
        salary = sc.nextDouble();
    }

    public void displayEmployee(){
        System.out.println("Empid - "+empid);
        displayPerson();
        System.out.println("Salary - "+salary);
    }
}
