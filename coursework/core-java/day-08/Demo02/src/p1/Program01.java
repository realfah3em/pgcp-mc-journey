package p1;
class Time{
    private int hr;
    private int min;

    public void setHr(int hr) {
        if(hr<0 || hr>23)
            throw new RuntimeException(); // generate unchecked Exception
        this.hr = hr;
    }

    public void setMin(int min) {
        if(min<0 || min>59)
//            throw new RuntimeException();
            throw new RuntimeException("min should be between 0 and 59");
        this.min = min;
    }

    @Override
    public String toString() {
        return "Time{" +
                "hr=" + hr +
                ", min=" + min +
                '}';
    }
}

public class Program01 {
    public static void main(String[] args) {
        Time t1 = new Time();
        t1.setHr(20); // hr>=0 hr<24
        t1.setMin(90);// min>=0 min<60
        System.out.println(t1);
    }
}
