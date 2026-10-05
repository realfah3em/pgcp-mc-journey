package p1;

class Circle{
    public int radius;
    //static double PI = 3.14; // field initializer
    public static double PI;

   // static block
   // this block is executed only once at the time of class loading
    static {
        System.out.println("Inside static block");
        PI = 3.14;
    }

    Circle(int radius){
        System.out.println("Inside Constructor");
        this.radius = radius;
    }

    public void calculateArea(){
        // To-do
    }
}

public class Program01 {
    public static void main(String[] args) {
        Circle c1 = new Circle(5);
        Circle c2 = new Circle(7);
        Circle c3 = new Circle(9);

        // non static members use of object is compulsary
        System.out.println("radius - "+c3.radius);

        // static members use of object is compulsary
        System.out.println("PI - "+Circle.PI);
        // static members are designed to be accessed on class name
    }
}
