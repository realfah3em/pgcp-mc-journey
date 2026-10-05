package p1;

import java.util.Scanner;

public class Manager extends Employee {
    double bonus;
    Manager(){

    }

    public Manager(int empid, double salary, double bonus) {
        super(empid, salary);
        this.bonus = bonus;
    }

    @Override
    public void accept(Scanner sc) {
        super.accept(sc);
        System.out.print("Enter bonus - ");
        bonus = sc.nextDouble();
    }

    @Override
    public void display() {
        super.display();
        System.out.println("Bonus - "+bonus);
    }

    @Override
    public void calculateTotalSalary() {
        double total = salary+bonus;
        System.out.println("Total salary of Manager - "+total);
    }


}
