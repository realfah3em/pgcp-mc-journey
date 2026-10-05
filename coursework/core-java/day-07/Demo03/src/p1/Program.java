package p1;

import java.util.Scanner;

abstract class Acceptable{
    public abstract void accept(Scanner sc);
    public abstract void display();
}

//abstract class Displayble{
//    public abstract void display();
//}

class Product extends Acceptable{
    int id;
    String name;
    double price;


    @Override
    public void accept(Scanner sc) {

    }

    @Override
    public void display() {

    }
}

class Employee extends Acceptable{
    int id;
    String name;
    double salary;

    @Override
    public void accept(Scanner sc) {

    }

    @Override
    public void display() {

    }
}

class Time extends Acceptable{
    int hr;
    int min;

    @Override
    public void accept(Scanner sc) {

    }

    @Override
    public void display() {

    }
}

public class Program {
    public static void main(String[] args) {
        Product p1 = new Product();
        Employee e1 = new Employee();
        Time t1 = new Time();

        p1.accept(null);
        e1.accept(null);
        t1.accept(null);

    }
}
