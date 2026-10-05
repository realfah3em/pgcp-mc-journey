package p4;

public class Program01 {
    public static void delay(){
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
        Object obj = new Object();

        class SunbeamThread extends Thread {
            @Override
            public void run() {
                synchronized (obj) {
                    String name = "Sunbeam";
                    for (int i = 0; i < name.length(); i++) {
                        System.out.print(name.charAt(i));
                        delay();
                    }
                    obj.notify();
                }
            }
        }

        class InfotechThread extends Thread {
            @Override
            public void run() {
               synchronized (obj) {
                   try {
                       obj.wait(); // releases the lock
                   } catch (InterruptedException e) {
                       throw new RuntimeException(e);
                   }
                   //lock the obj resource
                   String name = " Infotech";
                   for (int i = 0; i < name.length(); i++) {
                       System.out.print(name.charAt(i));
                       delay();
                   }
               }
            }
        }

        SunbeamThread st = new SunbeamThread();
        InfotechThread it = new InfotechThread();


        it.start();
        st.start();

        // Sunbeam Infotech

    }
}
