package p4;

public class Program01 {
    public static void add(Integer i1, Integer i2){
        System.out.println("Result - "+(i1+i2));
    }
    public static void sub(Integer i1, Integer i2){
        System.out.println("Result - "+(i1-i2));
    }
    public static void mul(Integer i1, Integer i2){
        System.out.println("Result - "+(i1*i2));
    }
    public static void div(Integer i1, Integer i2){
        System.out.println("Result - "+(i1/i2));
    }
    public static void main(String[] args) {
    add(10,20);
    sub(20,10);
    mul(11,22);
    div(10,5);
    }
}
