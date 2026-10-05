package p2;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Program03 {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        Collections.addAll(names,"Mukesh","Ramesh","Suresh","Anil","Ram","Sham","Mukesh","Ramesh", "Rohan", "Rahul");

        // display all names starting with R in asc order(natural order)
//        names.stream().filter(e->e.charAt(0)=='R').sorted().forEach(e->System.out.println(e));

        // display all names starting with R in desc order
        names.stream().filter(e->e.charAt(0)=='R').sorted((s1,s2)->s2.compareTo(s1)).forEach(e->System.out.println(e));

    }
}
