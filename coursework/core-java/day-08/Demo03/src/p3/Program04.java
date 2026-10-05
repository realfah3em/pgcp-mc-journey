package p3;
class Test{
    Test(){
        System.out.println("Test ctor");
    }

    @Override
    protected void finalize() throws Throwable {
        System.out.println("Test Finalize");
    }
}
public class Program04 {
    public static void main(String[] args) {
    Test t1 = new Test(); // GC
    t1 = null;
    System.gc();
    System.out.println("Program finished");
    }
}
