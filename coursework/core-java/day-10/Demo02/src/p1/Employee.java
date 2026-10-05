package p1;

import java.util.Objects;

public class Employee implements  Comparable<Employee> {
    int empid;
    String name;
    double salary;

    Employee(){

    }

    public Employee(int empid, String name, double salary) {
        this.empid = empid;
        this.name = name;
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empid=" + empid +
                ", name='" + name + '\'' +
                ", salary=" + salary +
                '}';
    }

    // For Treeset the implementation of Comprable or comparator is required
    @Override
    public int compareTo(Employee o) {
        return this.empid-o.empid;
    }

    // Hashcode and Equals methods are required only for
    // Hashset and Linked Hashset.
    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Employee employee)) return false;
        return empid == employee.empid;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(empid);
    }
}
