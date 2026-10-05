package p3;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Program01 {
    public static void displayEmployees(List<Employee> employeeList){
        for(Employee e:employeeList)
            System.out.println(e);
    }

    public static void main(String[] args) {
        List<Employee> employeeList = new ArrayList<Employee>();
        employeeList.add(new Employee(5,"Ram",20000));
        employeeList.add(new Employee(1,"Mukesh",40000));
        employeeList.add(new Employee(4,"Anil",10000));
        employeeList.add(new Employee(2,"Suresh",30000));
        employeeList.add(new Employee(3,"Sham",50000));

        System.out.println("Unsorted Employees -> ");
        displayEmployees(employeeList);

        System.out.println();
        System.out.println("Employees sorted on Natural Ordering -> ");
        Collections.sort(employeeList);
        displayEmployees(employeeList);

        System.out.println();
        System.out.println("Employees sorted on name in asc -> ");
        class EmpNameComparator implements Comparator<Employee>{
            @Override
            public int compare(Employee o1, Employee o2) {
                return o1.name.compareTo(o2.name);
            }
        }
        Collections.sort(employeeList,new EmpNameComparator());
        displayEmployees(employeeList);

        System.out.println();
        System.out.println("Employees sorted on sal in desc -> ");
        class EmpSalComparator implements Comparator<Employee>{
            @Override
            public int compare(Employee o1, Employee o2) {
                return Double.compare(o2.salary,o1.salary);
            }
        }
        Collections.sort(employeeList,new EmpSalComparator());
        displayEmployees(employeeList);

    }
}
