package p1;

public class Program01 {
    public static void main(String[] args) {
        Time t1 = new Time();
        //t1.hr = -100; // 0 to 23 -> write
        t1.setHr(20); // write -> mutate the field with valid data
        //t1.min = 80; // 0 to 59
        //System.out.println("Hr - "+t1.hr); // read
        System.out.println("Hr - "+t1.getHr()); // read
//        System.out.println("Min - "+t1.min);
    }
}
