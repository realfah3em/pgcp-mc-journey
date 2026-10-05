package p1;

import java.util.stream.Stream;

public class Program03 {
    public static void main(String[] args) {
        // display square of even numbers prefixed with Java
        Integer[] arr = {1,2,3,4,5,6};
        Stream.of(arr).filter(e->e%2==0).map(e->e*e).map(e->"Java"+e).forEach(e->System.out.println(e));


    }
}
