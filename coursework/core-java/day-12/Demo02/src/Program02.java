import java.util.ArrayList;
import java.util.List;

public class Program02 {
    public static void main(String[] args) {
        List<Employee> employees = new ArrayList<>();
        employees.add(new Employee(6,"Mukesh",20000,10));
        employees.add(new Employee(1,"Ramesh",50000,10));
        employees.add(new Employee(5,"Anil",40000,20));
        employees.add(new Employee(2,"Suresh",30000,10));
        employees.add(new Employee(4,"Sham",70000,30));
        employees.add(new Employee(3,"Ram",80000,20));

       // display the employees from dept 10 whose sal > 20000
        employees.stream().filter(e->e.deptno==10 && e.salary>20000).forEach(System.out::println);

        // display total salary spent on all employees. (sum() group function from mysql db)
       Double total_salary_spent =  employees.stream().map(e-> e.salary).reduce(0.0,(x,y)->x+y);
       System.out.println("Total Salary spent - "+total_salary_spent);

        // display total salary spent on all employees from dept 20.

    }
}
