package p1;

public class Program04 {
    public static void main(String[] args) {
        String s1 = "SUNBEAM";
        String s2 = "sunbeam";
        String s3 = s2.toUpperCase();// instance of a string is immutable
        // any operations on string will create a new String object.
        System.out.println("s1 - "+s1); // SUNBEAM
        System.out.println("s2 - "+s2); // sunbeam
        System.out.println("s3 - "+s3 ); // SUNBEAM
        System.out.println("s1==s2 : "+(s1==s2));
        System.out.println("s1==s3 : "+(s1==s3));

    }
}
