public class Employee implements Comparable<Employee> {
    int empid;
    String name;
    double salary;
    int deptno;

    Employee(){

    }

    public Employee(int empid, String name, double salary, int deptno) {
        this.empid = empid;
        this.name = name;
        this.salary = salary;
        this.deptno = deptno;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empid=" + empid +
                ", name='" + name + '\'' +
                ", salary=" + salary +
                ", deptno=" + deptno +
                '}';
    }

    @Override
    public int compareTo(Employee o) {
        return this.empid - o.empid;
    }
}
