package p1;
class Time{
    int hr;
    int min;

    public Time() {
        this(10,10);
    }

    public Time(int hr, int min) {
        this.hr = hr;
        this.min = min;
    }

    void displayTime(){
        System.out.println("Time - "+hr+":"+min);
    }
}
// Array for non-primitive types
public class Program04 {
    public static void main(String[] args) {
//        Time t1 = null; // reference
//        Time t2 = null;
//        Time t3 = null;
//        Time t4 = null;
//        Time t5 = null;
//        t1.displayTime();

        Time[] arr = new Time[5];
        arr[0] = new Time();
        arr[1] = new Time(11,30);
        arr[2] = new Time();
        arr[3] = new Time(12,40);
        arr[4] = new Time();

        for(int i=0;i<arr.length;i++){
            Time t = arr[i];
            t.displayTime();
        }

        System.out.println("-------------------------");

        for(Time t:arr)
            t.displayTime();

    }
}
