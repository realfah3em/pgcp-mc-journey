package p4;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Program03 {
    public static void main(String[] args) {
        List<String> l1 =  new ArrayList<>();
        l1.add("Anil");
        l1.add("Mukesh");
        l1.add("Ramesh");
        l1.add("Anil");

        // Fail-fast Iterator
        Iterator<String> itr = l1.iterator();
        while (itr.hasNext()){
            String s = itr.next();
                if(s.equals("Ramesh"))
                    l1.add("Suresh");
            System.out.println(s);
        }

    }
}
