package p1;

public class Program05 {
    public static void main(String[] args) {
        String s1 = new String("sunbeam");
        String s2 = new String("sunbeam");

        System.out.println("s1 - "+s1); // SUNBEAM
        System.out.println("s2 - "+s2); // sunbeam

        System.out.println("s1==s2 : "+(s1==s2));
        System.out.println("s1.equals(s2) : "+(s1.equals(s2)));
    }
}
