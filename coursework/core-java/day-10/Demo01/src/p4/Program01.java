package p4;

import java.util.Vector;

public class Program01 {
    public static void main(String[] args) {
        Vector<Integer> v1 = new Vector<>();
        for(int i=1;i<=10;i++)
            v1.add(i);
        for(int i=11;i<=20;i++)
            v1.add(i);
        v1.add(21);
        System.out.println("Capacity of v1 - "+v1.capacity());
        System.out.println("Size of v1 - "+v1.size());
    }
}
