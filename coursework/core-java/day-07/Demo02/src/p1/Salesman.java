package p1;

import java.util.Scanner;

public class Salesman extends Employee{
    int noOfSales;
    double commission;

    Salesman(){

    }

    public Salesman(int empid, double salary, int noOfSales, double commission) {
        super(empid, salary);
        this.noOfSales = noOfSales;
        this.commission = commission;
    }

    @Override
    public void accept(Scanner sc) {
        super.accept(sc);
        System.out.print("Enter the no of sales done - ");
        noOfSales = sc.nextInt();
        System.out.print("Enter the commission per sale - ");
        commission = sc.nextDouble();
    }

    @Override
    public void display() {
        super.display();
        System.out.println("No of sales - "+noOfSales);
        System.out.println("Commission per sale - "+commission);
    }

    @Override
    public void calculateTotalSalary() {
        double total = salary + (noOfSales*commission);
        System.out.println("total salary of salesman - "+total);
    }

}
