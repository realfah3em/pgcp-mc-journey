package p3;

import java.util.Scanner;

public class Program01 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Employee emp  = null;

         //emp = new Employee();
        //emp = new Manager(); // upcasting
        emp = new Salesman();

        emp.accept(sc); // Dynamic Method Dispatch
        emp.display();

    }
}
