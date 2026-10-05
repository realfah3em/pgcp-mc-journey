package p3;

public class Program02 {
    public static void main(String[] args) {
        Date d1 = new Date(1,1,2001);
        Date d2 = new Date(1,1,2001);
        if(d1 == d2)
            System.out.println("References are equal");
        else
            System.out.println("References are not Equal");
    }
}
