package p2;

class Time{
    int hr;
    int min;

    Time(){
        hr = 10;
        min = 10;
    }

    public Time(int hr, int min) {
        this.hr = hr;
        this.min = min;
    }

//    @Override
//    public String toString() {
//        return hr+" : "+min;
//    }


    @Override
    public String toString() {
        return "Time{" +
                "hr=" + hr +
                ", min=" + min +
                '}';
    }
}

public class Program {
    public static void main(String[] args) {
        Time t1 = new Time();
        int n1 = 10;

        System.out.println(n1);
        System.out.println(t1);
        System.out.println(t1.toString());

        Time t2 = new Time(11,30);
        System.out.println(t2);
    }
}
