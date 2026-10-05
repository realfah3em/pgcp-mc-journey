package p1;

public class Program02 {
    public static  void doWork(){
        double n1 = 11.22;
        doWork();
    }
    public static void main(String[] args) {
       doWork(); // StackOverflowError
        System.out.println("Program Finished");
    }
}
