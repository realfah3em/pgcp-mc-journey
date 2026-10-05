package p3;

public class Program03 {
    public static void main(String[] args) {
        Date d1 = new Date(1,1,2001);
        Date d2 = new Date(1,2,2001);
        //Date d2 = d1;
        if(d1.equals(d2))
            System.out.println("States are equal");
        else
            System.out.println("States are not Equal");
    }
}
