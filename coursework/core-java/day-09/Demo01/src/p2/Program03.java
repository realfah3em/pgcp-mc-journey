package p2;

public class Program03 {
    public static void main(String[] args) {
        StringBuffer sb1 = new StringBuffer("sunbeam");
        StringBuffer sb2 = new StringBuffer("sunbeam");
        String s1 = sb1.toString();
        String s2 = sb2.toString();


        StringBuilder sb3 = new StringBuilder("sunbeam");
        StringBuilder sb4 = new StringBuilder("sunbeam");

        System.out.println("sb1 - "+sb1);
        System.out.println("sb1 - "+sb2);
        System.out.println("sb3 - "+sb3);
        System.out.println("sb4 - "+sb4);

        System.out.println("sb1==sb2 - "+(sb1==sb2));
        System.out.println("sb3==sb4 - "+(sb3==sb4));

        System.out.println("sb1.equals(sb2) - "+(sb1.equals(sb2)));
        System.out.println("sb3.equals(sb4) - "+(sb3.equals(sb4)));
    // StringBufffer and StringBuilder classes have not overriden equals and hashcode methods
    //
    }
}
