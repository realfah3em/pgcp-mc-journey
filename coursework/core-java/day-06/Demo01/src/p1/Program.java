package p1;

import java.util.Scanner;

public class Program {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

//        Employee e1 = new Employee();
//        e1.accept(sc);
//        e1.display();

//        Manager m1 = new Manager();
//        m1.accept(sc); // Dynamic Method Dispatch (RunTime Polymorphism)
//        m1.display();

        Salesman s1 = new Salesman();
        s1.accept(sc);
        s1.display();
    }
}
