package p1;

import java.util.Set;
import java.util.TreeSet;

public class Program03 {
    public static void main(String[] args) {
        // order of elements is not guranteed
        // Set<String> s1 =  new HashSet<>();

        // It maintains the insertion order
        // Set<String> s1 =  new LinkedHashSet<>();

        // Stores the elemnts on their natural ordering or the order
        // provided by the comparator
        Set<String> s1 =  new TreeSet<>();
        s1.add("Mukesh");
        s1.add("Anil");
        s1.add("Suresh");
        s1.add("Ramesh");
        s1.add("Ram");
        s1.add("Ram"); // Duplicates are not allowed
        s1.add("Sham");
        //s1.add(null); // Not allowed in TreeSet

        System.out.println("Size of s1 - "+s1.size());

        for(String e:s1)
            System.out.println(e);

    }
}
