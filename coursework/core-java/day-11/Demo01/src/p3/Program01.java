package p3;

// Functional Interface
@FunctionalInterface
interface I1{
    void method1(); // Single Abstract Method (SAM)
}

//@FunctionalInterface // It is not a functional interface
interface I2{
    void method1();
    void method2();
}

@FunctionalInterface
interface I3{
    void method1(); // SAM
    default void method2(){

    }
}

@FunctionalInterface
interface I4{
    void method1(); // SAM
    default void method2(){

    }
    static void method3(){

    }

}

public class Program01 {
}
