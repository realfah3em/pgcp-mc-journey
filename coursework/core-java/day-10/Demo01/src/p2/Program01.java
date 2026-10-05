package p2;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

public class Program01 {
    public static void main(String[] args) {
        // list types store the data in the sequential order
        // it provides index based operation
        List<String> l1 = new ArrayList<>();
//        List<String> l1 = new Vector<>();
//        List<String> l1 = new LinkedList<>();
        l1.add("Anil");
        l1.add("Mukesh");
        l1.add("Ramesh");
        l1.add(1,"Suresh"); // adds the element at the specified position
        l1.set(2,"Ram");// replaces the element at the specified position
        // using iterator - to-do

        // using for-each - to-do

        // using index based for-loop
        for(int i=0;i<l1.size();i++){
            String s = l1.get(i);
            System.out.println(i + " - " + s);
        }

        System.out.println("Suresh present in the List ? - "+l1.contains("Suresh"));
        System.out.println("is Suresh removed ? - "+l1.remove("Suresh"));



    }
}
