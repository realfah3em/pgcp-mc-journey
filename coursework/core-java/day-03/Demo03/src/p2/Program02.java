package p2;

public class Program02 {
    public static void main(String[] args) {
        // initialize the state of an object with default values other than 0
        Time t1 = new Time();
        t1.init();
        Time t2 = new Time();
        t2.init();

        t1.displayTime();
        t2.displayTime();
    }
}
