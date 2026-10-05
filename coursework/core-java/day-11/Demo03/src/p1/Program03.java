package p1;

import java.io.*;

// Charcter Streams
public class Program03 {
    public static void readFromFile(){
        try(FileReader fr = new FileReader("file2.txt")) {
            int ch;
            while((ch = fr.read())!=-1)
                System.out.print((char)ch);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public static void main(String[] args) {
        readFromFile();
    }
}
