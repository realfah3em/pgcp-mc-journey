package p2;

public class Program01 {
    public static void div(int n, int d){
        System.out.println("Division - "+(n/d)); // BL
    }
    public static void main(String[] args) {
        try {
            div(10, 0);
        }catch (ArithmeticException e){
            System.out.println("Cannot divide by 0");
        }
        System.out.println("Program completed successfully");
    }
}
