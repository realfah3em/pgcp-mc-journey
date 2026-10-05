package p1;

public class Program01 {
    public static void add(int n1,int n2) // no of paramates - 2
     {
        System.out.println("Addition - "+(n1+n2));
    }

    // method overloading
    public static void add(int n1,int n2,int n3) // no of paramates - 2
    {
        System.out.println("Addition - "+(n1+n2+n3));
    }

    public static void square(int n) // type of parameter - int
    {
        System.out.println("Square - "+(n*n));
    }

    public static void square(double n) // type of parameter - double
    {
        System.out.println("Square - "+(n*n));
    }

    public static void div(int n1,double n2) // type of parameters - int,double
    {
        System.out.println("Division - "+(n1/n2));
    }

    public static void div(double n1,int n2) // type of parameters - double,int
    {
        System.out.println("Division - "+(n1/n2));
    }

    public static void main(String[] args) {
        add(10,20);
        add(10,20,30);
        square(5);
        square(5.5);
        div(10,2.5);
        div(10.5,2);
    }
}
