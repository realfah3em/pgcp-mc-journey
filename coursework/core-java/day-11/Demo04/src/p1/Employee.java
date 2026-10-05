package p1;

import java.io.Serializable;

public class Employee implements Serializable {
    private static final long serialVersionUID = 1L;
    int empid;
    String name;
    double salary;
    // static fields are not seralized except serialVersionUID
    static String company = "sunbeam";
    // transient fields are not seralized
    transient double tax;

    Employee(){

    }

    public void calculateTax(){
        tax = salary*0.1;
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
}
