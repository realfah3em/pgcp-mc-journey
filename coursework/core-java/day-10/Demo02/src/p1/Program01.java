package p1;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

public class Program01 {
    public static void main(String[] args) {
//        Set<Integer> s1 =  new HashSet<>();
//        Set<Integer> s1 =  new TreeSet<>();
        Set<Integer> s1 =  new LinkedHashSet<>();
        s1.add(10);
        s1.add(20);
        s1.add(30);
        s1.add(40);
        s1.add(10); // Duplicate elements are not allowed
        s1.add(null); // null is allowed
        s1.add(null);

        System.out.println("Size of s1 - "+s1.size());

        for(Integer e:s1)
            System.out.println(e);

    }
}
