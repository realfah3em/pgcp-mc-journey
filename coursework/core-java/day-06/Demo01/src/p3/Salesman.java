package p3;

import java.util.Scanner;

public class Salesman extends Employee {
    int noOfSales;
    double commission;

    public Salesman() {
    }

    public Salesman(int empid, double salary, int noOfSales, double commission) {
        super(empid, salary);
        this.noOfSales = noOfSales;
        this.commission = commission;
    }

    @Override
   public void accept(Scanner sc) {
        super.accept(sc);
        System.out.print("Enter no of sales done - ");
        noOfSales = sc.nextInt();
        System.out.print("Commission per sale - ");
        commission = sc.nextDouble();
    }

    @Override
    public void display() {
        super.display();
        System.out.println("No of sales -  "+noOfSales);
        System.out.println("Commission -  "+commission);
    }

    public void calculateCommission(){
        double total_commission = noOfSales * commission;
        System.out.println("Total commission - "+total_commission);
    }
}
