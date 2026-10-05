package p1;

import java.util.Scanner;

public class Program06 {
    public static void delay(){
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {

        class MyThread extends Thread{
            @Override
            public void run() {
                for (int i = 1; i <=

                        20 ; i++) {
                    System.out.println("MyThread Task - "+i);
                    delay();
                }
            }
        }

        Thread t1 = new MyThread();
        System.out.println("Thread state after creation - "+t1.getState());
        t1.start();
        System.out.println("Thread state after start - "+t1.getState());

        System.out.println("Press Enter to check the state in between- ");
        new Scanner(System.in).nextLine();
        System.out.println("Thread state in between - "+t1.getState());

        try {
            t1.join();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        System.out.println("Thread state after finish - "+t1.getState());


    }
}
