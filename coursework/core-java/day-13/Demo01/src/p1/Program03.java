package p1;

public class Program03 {
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
                for (int i = 1; i <=10 ; i++) {
                    System.out.println("MyThread Task - "+i);
                    delay();
                }
            }
        }
        Thread t1 = new MyThread();
        t1.start();

        class MyRunnable implements Runnable{
            @Override
            public void run() {
                for (int i = 1; i <=10 ; i++) {
                    System.out.println("My Runnable - "+i);
                    delay();
                }
            }
        }

        Thread t2 = new Thread(new MyRunnable());
        t2.start();

        for (int i = 1; i <=10 ; i++) {
            System.out.println("Main Task - "+i);
            delay();
        }




    }
}
