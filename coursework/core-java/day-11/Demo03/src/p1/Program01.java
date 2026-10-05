package p1;

import java.io.FileWriter;
import java.io.IOException;

// Charcter Streams
public class Program01 {
    public static void writeInFile(){
        try (FileWriter fw = new FileWriter("file1.txt",true)){
            fw.write("Hello\n");
            fw.write("World\n");
        } catch (IOException e) {
           e.printStackTrace();
        }

    }
    public static void main(String[] args) {
        writeInFile();
    }
}
