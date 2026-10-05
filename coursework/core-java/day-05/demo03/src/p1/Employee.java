package p1;

import java.util.Scanner;

// Employee has-a DateofJoining
// Employee has-a DateofTermination
public class Employee {
    int empid;
    String name;
    double salary;
    Date doj = new Date();// Associatation- Composition
    Date dot;// Associatation - Aggegration

    public Employee() {
    }


    public void terminateEmployee(){
        dot = new Date();
        System.out.println("Enter the date of termination - ");
        dot.acceptDate();
    }

    public void acceptEmployee(){
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the empid - ");
        empid = sc.nextInt();
        System.out.print("Enter the name - ");
        name = sc.next();
        System.out.print("Enter the salary - ");
        salary = sc.nextDouble();
        System.out.println("Enter the Date of Joining - ");
        doj.acceptDate(); //
    }

    public void displayEmployee(){
        System.out.println("Empid - "+empid);
        System.out.println("Name - "+name);
        System.out.println("Salary - "+salary);
        System.out.print("Date of Joining - ");
        doj.displayDate();
        if(dot!=null) {
            System.out.print("Date of Termination - ");
            dot.displayDate();
        }
    }


}
