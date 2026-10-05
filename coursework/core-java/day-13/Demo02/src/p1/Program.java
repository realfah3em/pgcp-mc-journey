package p1;

class Outer{
    // members of the class -> static or non static

    // fields
    static int outer_field1 = 10;
    int outer_field2 = 10;

    // methods
    static void method1(){}
    void method2(){}

    //static Nested class
    static class Inner{
        // members
        // fields
        static int inner_field1 = 100;
        int inner_field2 = 200;

        // methods
        static void method1(){
            System.out.println(inner_field1);
            //System.out.println(inner_field2); // NOT OK
            System.out.println(outer_field1);
            //System.out.println(outer_field2); // NOT OK

        }
         void method2(){
             System.out.println(inner_field1);
             System.out.println(inner_field2);
             System.out.println(outer_field1);
             //System.out.println(outer_field2); // NOT OK
        }
    }

}

public class Program {
    public static void main(String[] args) {
        //Outer o1 = new Outer();
        Outer.Inner in = new Outer.Inner();

    }
}
