package p1;

import java.util.ArrayList;
import java.util.Collection;

public class Program02 {
    public static void main(String[] args) {
        Collection<Integer> c1 = new ArrayList<>();
        c1.add(10);
        c1.add(20);
        c1.add(30);
        c1.add(40);
        c1.add(50);

        System.out.println("Size of c1 - "+c1.size());

        System.out.println("is 30 present in the collection - "+c1.contains(30));
        System.out.println("40 removed from collection? - "+c1.remove(40));
        System.out.println("70 removed from collection? - "+c1.remove(70));

        System.out.println("After remove, Size of c1 - "+c1.size());

    }
}
