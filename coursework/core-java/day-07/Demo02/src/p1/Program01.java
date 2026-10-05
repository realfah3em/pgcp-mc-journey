package p1;

import java.util.Scanner;

public class Program01 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Employee emp = null;

        //emp = new Manager(); // upcasting
        //emp = new Salesman(); // upcasting

        emp.accept(sc); // Dynamic Method Dispatch
        emp.display();

        //emp.calculateTotalSalary(); // object slicing

        if(emp instanceof Manager) {
            Manager m = (Manager) emp; // Downcasting
            m.calculateTotalSalary();
        }

        if(emp instanceof Salesman) {
            Salesman sm = (Salesman) emp; // Downcasting
            sm.calculateTotalSalary();
        }

    }
}
