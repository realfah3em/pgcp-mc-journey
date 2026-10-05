package p2;

import java.util.*;

public class Program02 {
    public static void main(String[] args) {
        //Map<Integer,String> m1 = new LinkedHashMap<>();
        Map<Integer,String> m1 = new TreeMap<>();
        m1.put(1,"Anil");
        m1.put(2,"Mukesh");
        m1.put(3,"Ramesh");
        m1.put(3,"Ramesh"); // Duplicate keys are not allowed
        m1.put(3,"Suresh"); // If keys are duplicated the values are replaced
        m1.put(4,"Anil"); // Duplicate values are allowed
        //m1.put(null,"Anil"); // null as key is allowed except for Treemap
        //m1.put(null,"Mukesh"); // value against null key will be replaced
        m1.put(5,null); // null value is allowed
        m1.put(6,null); // multiple null values are allowed


        Set<Integer> keys = m1.keySet();
        for (Integer k:keys)
            System.out.println(k + ", "+m1.get(k));


        System.out.println();
        Collection<String> values = m1.values();
        for (String v:values)
            System.out.println(v);


    }
}
