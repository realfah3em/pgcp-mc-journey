package p1;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

// Charcter Streams
public class Program02 {
    public static void writeInFile(){
        try(FileWriter fw = new FileWriter("file2.txt",true);
            PrintWriter pw = new PrintWriter(fw)){
            pw.println("Hello");
            pw.println("World");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    public static void main(String[] args) {
        writeInFile();
    }
}
