package p1;

final class Test{
    private final int n1 = 10;
    final int n2;
    final int n3;
    {
        // n1 = 100;// NOT OK
        n2 = 20;
    }
    Test(){
        //n2 =  200; // NOT OK
        n3 = 30;
    }

    public final void m1(){
        System.out.println("Final Method 1");
    }

    public final int getN1() {
        return n1;
    }
}


// we cannot inherit the final class
//class TestChild extends Test{
    // cannot override the final methods
//    public final void m1() {} // NOT OK
//}


public class Program {
    public static void main(String[] args) {
        // final int n1 = 10;
        // n1 = 20; // NO OK

        final int n1;
        n1 = 10; // OK
        //n1 = 20;// NOT OK
    }
}
