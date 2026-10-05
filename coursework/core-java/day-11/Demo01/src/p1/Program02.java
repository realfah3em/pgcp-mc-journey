package p1;

import java.util.Scanner;

interface Shape{
    void acceptData(Scanner sc);
    void calculateArea();
     static void allShapeAreas(Shape[] shapes){
        shapes[0] = new Circle();
        shapes[1] = new Rectangle();
        shapes[2] = new Circle();
        shapes[3] = new Circle();
        shapes[4] = new Rectangle();

        // operations on all types of shapes
        for(Shape s:shapes) {
            s.acceptData(null);
            s.calculateArea();
        }
    }
}



class Circle implements Shape{

    @Override
    public void acceptData(Scanner sc) {
        System.out.println("Circle:accept");
    }

    @Override
    public void calculateArea() {
        System.out.println("Circle:Area");
    }
}

class Rectangle implements Shape{

    @Override
    public void acceptData(Scanner sc) {
        System.out.println("Rectangle:accept");
    }

    @Override
    public void calculateArea() {
        System.out.println("Rectangle:Area");
    }
}
public class Program02 {


    public static void main(String[] args) {
        Shape[] shapes = new Shape[5];
        Shape.allShapeAreas(shapes);

    }
}
