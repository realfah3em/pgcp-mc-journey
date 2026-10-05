package p4;

import java.util.Enumeration;
import java.util.Vector;

public class Program02 {
    public static void main(String[] args) {
        Vector<String> v1 = new Vector<>();
        v1.add("Anil");
        v1.add("Mukesh");
        v1.add("Ramesh");
        v1.add("Suresh");

        // to-do
        // iterator
        // for-each
        // index based for-loop

        //Enumeration
        Enumeration<String> en = v1.elements();
        while(en.hasMoreElements()){
            String s = en.nextElement();
            System.out.println(s);
        }
           }
}
