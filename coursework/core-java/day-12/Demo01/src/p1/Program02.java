package p1;

import java.util.stream.Stream;

public class Program02 {
    public static void main(String[] args) {
        // display square of even numbers prefixed with Java
        Integer[] arr = {1,2,3,4,5,6};

        Stream<Integer> s1 = Stream.of(arr);
        Stream<Integer> s2 = s1.filter(e->e%2==0);
        Stream<Integer> s3 = s2.map(e->e*e);
        Stream<String> s4 = s3.map(e->"Java"+e);
        s4.forEach(e->System.out.println(e));

    }
}
