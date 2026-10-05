package p1;

import java.util.Scanner;

public class Program01 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Person p1 = new Person();
        p1.acceptPerson(sc);
        p1.displayPerson();
    }
}
