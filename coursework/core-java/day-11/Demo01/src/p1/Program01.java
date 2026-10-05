package p1;

import java.util.Scanner;

interface Acceptable{
    void accept(Scanner sc);
    default void display(){
    }
}


class Employee implements Acceptable{
    @Override
    public void accept(Scanner sc) {
        System.out.println("Employee::accept");
    }
    @Override
    public void display() {
        System.out.println("Employee::display");
    }
}

class Product implements Acceptable{
    @Override
    public void accept(Scanner sc) {
        System.out.println("Product::accept");
    }
}

class Date implements Acceptable{
    @Override
    public void accept(Scanner sc) {
        System.out.println("Date::accept");
    }

    @Override
    public void display() {
        System.out.println("Date::display");
    }
}

public class Program01 {
    public static void main(String[] args) {
        Acceptable a1 = null;
        //a1 = new Employee();
        a1= new Product();
        //a1 = new Date();

        a1.accept(null);
        a1.display();

    }
}
