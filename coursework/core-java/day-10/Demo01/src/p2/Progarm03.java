package p2;

import java.util.ArrayList;
import java.util.List;

public class Progarm03 {
    public static void displayEmployees(List<Employee> employeeList){
        for(Employee e:employeeList)
            System.out.println(e);
    }

    public static void main(String[] args) {
        List<Employee> employeeList = new ArrayList<>();
        employeeList.add(new Employee(1,"Anil",10000));
        employeeList.add(new Employee(2,"Mukesh",20000));
        employeeList.add(new Employee(3,"Ramesh",30000));
        employeeList.add(new Employee(4,"Suresh",40000));
        employeeList.add(new Employee(5,"Ram",50000));

        displayEmployees(employeeList);

        Employee e = new Employee();
        e.empid = 3;
        System.out.println("Index of employee with id 3 : "+employeeList.indexOf(e));

        employeeList.remove(e);
        employeeList.remove(3);
        System.out.println("After removing element from list ->");
        displayEmployees(employeeList);
    }
}
