package p1;

public class Test {
    // members (fields or methods)
    private int n1; // accessiable only within this class
    int n2; // default -> package level private (accessiable within this package)
    protected int n3; // accessiable within the same package and outside the package only in the subclass
    public int n4; // accessiable everywhere

    public void displayTest(){
        System.out.println(n1);
        System.out.println(n2);
        System.out.println(n3);
        System.out.println(n4);
    }
}
