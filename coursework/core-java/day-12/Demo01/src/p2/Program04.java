package p2;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Program04 {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        Collections.addAll(names,"Mukesh","Ramesh","Suresh","Anil","Ram","Sham","Mukesh","Ramesh", "Rohan", "Rahul");

        // display names starting with R suffixed with "sunbeam" in desc order
        names.stream()
                .filter(e->{
                    System.out.println("Inside Filter - "+e);
                    return e.charAt(0)=='R';
                })
                .sorted((s1,s2)->{
                    System.out.println("Inside Sorted - "+s1 + ", "+s2);
                    return s2.compareTo(s1);
                })
                .map(e->{
                    System.out.println("Inside Map - "+e);
                    return e+" - sunbeam";
                })
                .forEach(e->System.out.println("Inside For-Each - "+e));


    }
}
