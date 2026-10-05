package p3;

import java.util.Scanner;

public class Program02 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Employee emp = null;

//        emp = new Employee();
//        emp = new Manager();
        emp = new Salesman(); // upcasting

        emp.accept(sc);
        emp.display();
        //emp.calculateCommission(); // Object Slicing

        if(emp instanceof Salesman) {
            Salesman sm =  (Salesman) emp; // Downcasting
            sm.calculateCommission();
        }
    }
}
