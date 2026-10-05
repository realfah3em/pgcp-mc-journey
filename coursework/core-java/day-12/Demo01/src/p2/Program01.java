package p2;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Program01 {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        Collections.addAll(names,"Mukesh","Ramesh","Suresh","Anil","Ram","Sham","Mukesh","Ramesh");

        // display all the names starting with S
        // names.stream().filter(s->s.charAt(0)=='S').forEach(s->System.out.println(s));

        // display first 4 names
        // names.stream().limit(4).forEach(e->System.out.println(e));

        //skip first 2 display next 4 names
        names.stream().skip(2).limit(4).forEach(e->System.out.println(e));

    }
}
