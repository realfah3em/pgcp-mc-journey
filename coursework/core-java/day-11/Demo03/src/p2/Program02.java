package p2;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.List;

public class Program02 {
    public static void readFromFile(){
        try(FileInputStream fis = new FileInputStream("file3.db")){
            try(ObjectInputStream ois = new ObjectInputStream(fis)){
                List<Employee> employeeList =(List<Employee>) ois.readObject();
                employeeList.forEach(e->System.out.println(e));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        readFromFile();
    }
}
