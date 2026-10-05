package p1;
class Test{
    int n1 = 10; // field initializer
    int n2;
    int n3;

    // instance/object initializer
    {
        System.out.println("Instance Initializer-1");
        n2 = 20;
        n1 = 100;
    }

    {
        System.out.println("Instance Initializer-2");
        n2 = 200;
        n1 = 100;
    }


    public Test(){
        System.out.println("Constructor");
        n3 = 30;
        n1 = 1000;
    }

    public void displayTest(){
        System.out.println("n1 - "+n1);
        System.out.println("n2 - "+n2);
        System.out.println("n3 - "+n3);
    }
}
public class Program01 {
    public static void main(String[] args) {
        Test t1 = new Test();
        t1.displayTest();
    }
}
