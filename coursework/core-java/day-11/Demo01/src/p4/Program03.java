package p4;

import java.util.function.BinaryOperator;

public class Program03 {

    // JS,Kotlin : Higher Order Functions
    public static void arithmeticOperation(Integer i1, Integer i2, BinaryOperator<Integer> op){
        System.out.println("Result - "+op.apply(i1,i2));
    }

    // capturing lambda expressions
    // closures in JS,Kotlin
    public static void main(String[] args) {
        int z = 30; // final or effectively final
        // z = 50;
        arithmeticOperation(10, 20, (x,y)->x+y+z);
        arithmeticOperation(20,10,(x,y)->x-y+z);
    }
}
