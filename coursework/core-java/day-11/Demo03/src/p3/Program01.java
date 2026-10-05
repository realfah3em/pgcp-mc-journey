package p3;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class Program01 {
    public static void main(String[] args) {
        Map<Integer,String> m1 = new LinkedHashMap<>();
        m1.put(101,"Anil");
        m1.put(102,"Mukesh");
        m1.put(103,"Ramesh");
        m1.put(104,"Suresh");

        Set<Map.Entry<Integer,String>> entries = m1.entrySet();
        for(Map.Entry<Integer,String> e:entries)
            System.out.println(e.getKey() + " - "+e.getValue());

    }
}
