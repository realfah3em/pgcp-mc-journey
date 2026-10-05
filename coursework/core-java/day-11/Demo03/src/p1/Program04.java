package p1;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

// Charcter Streams
public class Program04 {
    public static void readFromFile(){
        try(FileReader fr = new FileReader("file2.txt")) {
            try(BufferedReader br = new BufferedReader(fr)){
                String line;
                while((line = br.readLine())!=null)
                    System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public static void main(String[] args) {
        readFromFile();
    }
}
