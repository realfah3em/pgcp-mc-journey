package p2;
class Singleton{
    public Singleton() {
        System.out.println("Inside Ctor");
    }
}
public class Program01 {
    public static void main(String[] args) {
        Singleton s1 = new Singleton();
        Singleton s2 = new Singleton();
        Singleton s3 = new Singleton();
        Singleton s4 = new Singleton();
        Singleton s5 = new Singleton();
    }
}
