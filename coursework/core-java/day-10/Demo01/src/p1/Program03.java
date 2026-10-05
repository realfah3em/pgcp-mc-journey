package p1;

import java.util.ArrayList;
import java.util.Collection;

public class Program03 {
    public static void main(String[] args) {
        Collection<Student> c1 = new ArrayList<>();
        c1.add(new Student(1,"Anil",50));
        c1.add(new Student(2,"Mukesh",60));
        c1.add(new Student(3,"Ramesh",70));
        c1.add(new Student(4,"Suresh",80));

        Student s = new Student();

        // contains and remove calls equals method of your class internally
        s.rollno = 2;
        System.out.println("Is student with rollno 2 present ? "+c1.contains(s));

        s.rollno=3;
        System.out.println("Is student with rollno 3 removed ? "+c1.remove(s));
    }
}
