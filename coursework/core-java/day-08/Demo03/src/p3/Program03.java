package p3;

import java.time.LocalDate;

public class Program03 {
    public static void main(String[] args) {
        LocalDate d1 = LocalDate.now();
        System.out.println(d1);

        LocalDate d2 = LocalDate.of(2000,1,1);
        System.out.println(d2);
    }
}
