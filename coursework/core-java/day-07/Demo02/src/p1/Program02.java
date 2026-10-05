package p1;

import java.util.Scanner;

public class Program02 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Employee emp = null; // only reference of abstract class is allowed
        // emp = new Employee(); // cannot create instance of an abstract class

        // emp = new Manager(); // upcasting
        emp = new Salesman(); // upcasting

        emp.accept(sc); // Dynamic Method Dispatch
        emp.display();
        emp.calculateTotalSalary(); //



    }
}
