package p2;
import java.util.Scanner;

// in java it is considered interfaces are immutable
interface Acceptable{
    int n1 = 10;
    void accept(Scanner sc);
}

// to add new method design/ protocols create new interfaces
interface Displayble{
    void display();
}

class Product implements Acceptable,Displayble{
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

class Employee implements Acceptable{
    int id;
    String name;
    double salary;

    @Override
    public void accept(Scanner sc) {

    }

}

class Time implements Acceptable,Displayble{
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

        Acceptable a1; // reference of interface is allowed
        //a1 = new Acceptable(); // instance of interface cannot be created
        a1 = new Employee(); // upcasting
        a1 = new Product(); // upcasting
        a1 = new Time(); // upcasting
    }
}
