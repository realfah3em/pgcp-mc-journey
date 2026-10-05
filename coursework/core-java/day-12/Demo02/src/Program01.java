import java.util.ArrayList;
import java.util.List;

public class Program01 {
    public static void main(String[] args) {
        List<Employee> employees = new ArrayList<>();
        employees.add(new Employee(6,"Mukesh",20000,10));
        employees.add(new Employee(1,"Ramesh",50000,10));
        employees.add(new Employee(5,"Anil",40000,20));
        employees.add(new Employee(2,"Suresh",30000,10));
        employees.add(new Employee(4,"Sham",70000,30));
        employees.add(new Employee(3,"Ram",80000,20));

        //display all the employees sorted on empid in asc order
        System.out.println("Employees displayed sorted on empid in asc order");
        employees.stream().sorted().forEach(System.out::println);
        System.out.println("-------------------------------------------");

        //display all the employees salary in desc order
        System.out.println("Employees sorted on salary in desc order");
        employees.stream().sorted((e1,e2)->Double.compare(e2.salary,e1.salary)).forEach(System.out::println);
        System.out.println("-------------------------------------------");

        // display all the employees with sal > 30000
        System.out.println("Employees with sal > 30000");
        employees.stream().filter(e->e.salary>30000).forEach(System.out::println);
        System.out.println("-------------------------------------------");


        // display the original collection
        System.out.println("Original Collection -> ");
        employees.forEach(System.out::println);
    }
}
