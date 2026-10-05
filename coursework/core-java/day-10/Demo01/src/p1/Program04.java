package p1;

import java.util.*;

public class Program04 {
    public static void main(String[] args) {
        Collection<Student> c1 = new ArrayList<>();
        c1.add(new Student(1,"Anil",50));
        c1.add(new Student(2,"Mukesh",60));
        c1.add(new Student(3,"Ramesh",70));
        c1.add(new Student(4,"Suresh",80));

        Iterator<Student> itr = c1.iterator();
        System.out.println("Using While -> ");
        while(itr.hasNext()){
           Student s = itr.next();
           System.out.println(s);
        }

        System.out.println();
        System.out.println("Using For loop -> ");
        for(Iterator<Student>itr2 = c1.iterator() ;itr2.hasNext();){
                Student s = itr2.next();
                System.out.println(s);
        }

        System.out.println();
        System.out.println("Using For-Each -> ");
        for(Student s:c1)
            System.out.println(s);
    }
}
