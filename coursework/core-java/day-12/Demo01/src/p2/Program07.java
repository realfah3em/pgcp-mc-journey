package p2;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Program07 {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        Collections.addAll(names,"Mukesh","Ramesh","Suresh","Anil","Ram","Sham","Mukesh","Ramesh", "Rohan", "Rahul");
        names.stream()
                .distinct()
                .forEach(System.out::println);


    }
}
