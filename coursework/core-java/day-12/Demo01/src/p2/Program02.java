package p2;

import java.util.*;
import java.util.stream.Stream;

public class Program02 {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        Collections.addAll(names,"Mukesh","Ramesh","Suresh","Anil","Ram","Sham","Mukesh","Ramesh");

        // display unique names
        names.stream().distinct().forEach(e->System.out.println(e));

        // display count of distinct names
        long distint_name_count = names.stream().distinct().count();
        System.out.println("Count of distinct names - "+distint_name_count);
    }
}
