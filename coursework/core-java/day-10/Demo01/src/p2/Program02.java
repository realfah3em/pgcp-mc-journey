package p2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class Program02 {
    public static void main(String[] args) {
        List<String> l1 = new ArrayList<>();
        l1.add("Anil");
        l1.add("Mukesh");
        l1.add("Ramesh");
        l1.add("Suresh");
        l1.add("Ram");
        l1.add("Mukesh");
        l1.add("Sham");

        // using index based for-loop
        for(int i=0;i<l1.size();i++){
            String s = l1.get(i);
            System.out.println(i + " - " + s);
        }

        ListIterator<String> fw_itr = l1.listIterator();
        ListIterator<String> rev_itr = l1.listIterator(l1.size());

        System.out.println("index of Suresh - "+l1.indexOf("Suresh"));
        System.out.println("index of Mukesh - "+l1.indexOf("Mukesh"));
        System.out.println("last index of Mukesh - "+l1.lastIndexOf("Mukesh"));

        System.out.println("remove element from index 2 - "+l1.remove(2));
        System.out.println("remove Mukesh - "+l1.remove("Mukesh"));

        for(int i=0;i<l1.size();i++){
            String s = l1.get(i);
            System.out.println(i + " - " + s);
        }
    }
}
