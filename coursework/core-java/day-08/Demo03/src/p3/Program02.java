package p3;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Program02 {
    public static void main(String[] args) {
        Calendar c1 = new GregorianCalendar();
        System.out.println("c1 - "+c1);

        Calendar c2 = Calendar.getInstance();
        System.out.println("c2 - "+c2);

        int day = c2.get(Calendar.DAY_OF_MONTH);
        int month = c2.get(Calendar.MONTH) + 1;
        int year = c2.get(Calendar.YEAR);
        System.out.println("Date - "+day+"/"+month+"/"+year);

        Calendar c3 = new GregorianCalendar(2000,1,1);
        System.out.println("c3 - "+c3);

    }
}
