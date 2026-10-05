package p1;

class Test{
    int n1;
    static int n2 = 10;

    static{
        System.out.println("static block");
        n2 = 20;
    }

    // instance member
    // only non static methods receive this reference
    public void method1(){
        System.out.println("Method 1");
        System.out.println(n1);
        System.out.println(n2);
    }

    // class level member
    // static methods do not get this reference
    public static void method2(){
        System.out.println("Method 2");
        // System.out.println(n1);// NOT OK
        System.out.println(n2);
    }
}

public class Program01 {
    public static void main(String[] args) {
        System.out.println("n2 - "+Test.n2); //
        Test.method2();

        //System.out.println("n1 - "+Test.n1); // NOT OK -> Instance member
        //Test.method1(); // NOT OK -> Instance member

        Test t1 = new Test();
        System.out.println("n1 - "+t1.n1); // OK -> Instance member
        t1.method1(); // OK -> Instance member

        //Test.method1(); // NOT OK
        Test.method2();

        // It is not recommended
        System.out.println("n2 - "+t1.n2); // OK
        t1.method2();


    }
}
