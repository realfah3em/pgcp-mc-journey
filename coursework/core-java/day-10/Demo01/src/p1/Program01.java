package p1;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.LinkedList;

public class Program01 {
    public static void main(String[] args) {
        Collection<Integer> c1 = new ArrayList<>();
        //Collection<Integer> c1 = new LinkedList<>();
        //Collection<Integer> c1 = new LinkedHashSet<>();
        c1.add(10); // to add the elements in the collection
        c1.add(20);
        c1.add(30);
        c1.add(40);
        c1.add(50);

        //c1.clear(); // remove all the elements from the collection
        System.out.println("Size of c1 - "+c1.size());
        System.out.println("is collection empty - "+c1.isEmpty());
    }
}
