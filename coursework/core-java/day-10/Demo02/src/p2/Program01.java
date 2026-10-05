package p2;

import java.util.*;

public class Program01 {
    public static void main(String[] args) {
//        Map<Integer,String> m1 = new HashMap<>();
//        Map<Integer,String> m1 = new LinkedHashMap<>();
        Map<Integer,String> m1 = new TreeMap<>();
        m1.put(132,"Suresh");
        m1.put(154,"Ramesh");
        m1.put(143,"Anil");
        m1.put(121,"Mukesh");

        Set<Integer> keys = m1.keySet();
        for (Integer k:keys)
            System.out.println(k + ", "+m1.get(k));


        System.out.println();


    }
}
