package p2;

import java.util.stream.Stream;

public class Program06 {
    public static void main(String[] args) {

        // Method References -> Shorthand implementation of lambda expression
        // (::) -> Method Reference Operator
    Integer res =  Stream.of(1,2,3,4,5,6,7,8,9).reduce(0,Integer::sum);
    System.out.println("Result - "+res);
    }
}
