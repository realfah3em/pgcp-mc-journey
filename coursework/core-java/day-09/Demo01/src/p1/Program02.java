package p1;

public class Program02 {
    public static void main(String[] args) {
        String s1 = "sunbeam";
        String s2 = "sunbeam";
        s2 = "infotech"; // references are mutable
        System.out.println(s1);
        System.out.println(s2);
        System.out.println("s1==s2 : "+(s1==s2));

    }
}
