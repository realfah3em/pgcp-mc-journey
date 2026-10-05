package p1;

public class Program01 {
    public static void delay(){
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {

        for (int i = 1; i <=10 ; i++) {
            System.out.println("Main Task1 - "+i);
            delay();
        }

        for (int i = 1; i <=10 ; i++) {
            System.out.println("Main Task2 - "+i);
            delay();
        }
    }
}
