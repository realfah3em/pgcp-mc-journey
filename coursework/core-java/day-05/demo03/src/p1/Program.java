package p1;


public class Program {
    public static void main(String[] args) {
        Employee e1 = new Employee();
        e1.acceptEmployee();

        Employee e2 = new Employee();
        e2.acceptEmployee();
        e2.terminateEmployee();

        e1.displayEmployee();
        e2.displayEmployee();
    }
}
