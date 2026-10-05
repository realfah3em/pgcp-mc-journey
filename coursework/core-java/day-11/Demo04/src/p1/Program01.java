package p1;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class Program01 {

    public static void writeIntoFile(List<Employee> employeeList){
        try(FileOutputStream fos = new FileOutputStream("file1.db")){
            try(ObjectOutputStream oos = new ObjectOutputStream(fos)){
                    oos.writeObject(employeeList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void readFromFile(){
        try(FileInputStream fis = new FileInputStream("file1.db")){
            try(ObjectInputStream ois = new ObjectInputStream(fis)){
                List<Employee> employeeList =(List<Employee>) ois.readObject();
                employeeList.forEach(e->System.out.println(e));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        List<Employee> employeeList = new ArrayList<>();
        employeeList.add(new Employee(1,"Anil",10000));
        employeeList.add(new Employee(2,"Mukesh",20000));
        employeeList.add(new Employee(3,"Ramesh",30000));
        employeeList.add(new Employee(4,"Suresh",40000));
        writeIntoFile(employeeList);
        //readFromFile();
    }
}
