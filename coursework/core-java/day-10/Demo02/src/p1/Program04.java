package p1;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

public class Program04 {
    public static void main(String[] args) {
        // for using set the hashcode and equals must be compulsary overriden
        // to avoid duplicates inside them
        //Set<Employee> employees = new HashSet<>();
        //Set<Employee> employees = new LinkedHashSet<>();

        Set<Employee> employees = new TreeSet<>();
        employees.add(new Employee(1,"Anil",10000));
        employees.add(new Employee(2,"Mukesh",20000));
        employees.add(new Employee(3,"Ramesh",30000));
        employees.add(new Employee(2,"Mukesh",20000));

        for(Employee e:employees)
            System.out.println(e);
    }
}
