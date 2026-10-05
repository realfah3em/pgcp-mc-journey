package p4;

import java.util.Arrays;
import java.util.function.BinaryOperator;

public class Program02 {

    public static void arithmeticOperation(Integer i1, Integer i2, BinaryOperator<Integer> op){
        System.out.println("Result - "+op.apply(i1,i2));
    }

    // non-capturing lambda expressions
    public static void main(String[] args) {
        int z = 30;
        arithmeticOperation(10, 20, (x,y)->x+y);
        arithmeticOperation(20,10,(x,y)->x-y);
    }
}
