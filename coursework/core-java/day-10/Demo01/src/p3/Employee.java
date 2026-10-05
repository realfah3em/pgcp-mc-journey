package p3;

public class Employee implements Comparable<Employee> {
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

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Employee employee)) return false;
        return empid == employee.empid;
    }

    @Override
    public int compareTo(Employee o) {
        return this.empid - o.empid;
    }
}
