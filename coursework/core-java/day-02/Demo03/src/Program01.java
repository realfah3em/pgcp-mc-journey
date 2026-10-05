import java.util.Scanner;

class Time{
    // fields
    int hr;
    int min;

    // methods
    void acceptTime(){
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the hrs - ");
        hr = sc.nextInt();
        System.out.print("Enter the mins - ");
        min =  sc.nextInt();
    }

    void displayTime(){
    System.out.println("Time = "+hr+ " : "+min); // Time = 10:20
    }
}

public class Program01 {
    public static void main(String[] args) {
        Time t1 = new Time();
        t1.acceptTime();
        t1.displayTime();
    }
}
