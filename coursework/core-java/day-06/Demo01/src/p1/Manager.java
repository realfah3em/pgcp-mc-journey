package p1;

import java.util.Scanner;

// Manager is-a Employee
public class Manager extends Employee{
    double bonus;

    public Manager(){
    }

    public Manager(int empid, double salary, double bonus) {
        super(empid, salary);
        this.bonus = bonus;
    }

    //  method overriding
    public void accept(Scanner sc){
        super.accept(sc);
        System.out.print("Enter the bonus - ");
        bonus = sc.nextDouble();
    }

    // method overriding
    public void display(){
        super.display();
        System.out.println("Bonus - "+bonus);
    }
}
