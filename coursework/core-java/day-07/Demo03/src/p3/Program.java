package p3;

import java.util.Scanner;

interface  Shape{
   void accept(Scanner sc);
    void calculateArea();
}


class Circle implements Shape{
    int radius;

    @Override
    public void accept(Scanner sc) {
        System.out.print("Enter the radius - ");
        radius = sc.nextInt();
    }

    @Override
    public void calculateArea() {
        System.out.println("Area of circle - "+(3.14 * radius * radius));
    }
}

class Rectangle implements   Shape{
    int length;
    int breadth;

    @Override
    public void accept(Scanner sc) {
        System.out.print("Enter the length - ");
        length = sc.nextInt();
        System.out.print("Enter the breadth - ");
        breadth = sc.nextInt();

    }

    @Override
    public void calculateArea() {
        System.out.println("Area of rectangle - "+(length * breadth));

    }
}
public class Program {

    public static int menu(Scanner sc){
        int choice;
        System.out.println("0. EXIT");
        System.out.println("1. Area of Circle ");
        System.out.println("2. Area of Rectangle");
        System.out.print("Enter your choice - ");
        choice = sc.nextInt();
        System.out.println("--------------------------");
        return  choice;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Shape shape = null;
        int choice;
        while((choice= menu(sc))!=0){
            switch (choice){
                case 1:
                    shape = new Circle();
                    break;
                case 2:
                    shape = new Rectangle();
                    break;
                default:
                    System.out.println("Invalid choice..");
                    break;
            }
            if(shape!=null){
                shape.accept(sc);
                shape.calculateArea();
                shape = null;
            }
        }


    }
}
