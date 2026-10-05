package p2;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class Program01 {
    public static void writeIntoFile(List<Employee> employeeList){
        try(FileOutputStream fos = new FileOutputStream("file3.db")){
            try(ObjectOutputStream oos = new ObjectOutputStream(fos)){
                    oos.writeObject(employeeList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        List<Employee> employeeList = new ArrayList<>();
        employeeList.add(new Employee(1,"Anil",10000));
        employeeList.add(new Employee(2,"Mukesh",20000));
        writeIntoFile(employeeList);
    }
}
