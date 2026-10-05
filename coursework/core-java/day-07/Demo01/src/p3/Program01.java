package p3;

public class Program01 {
    public static void main(String[] args) {
        Date d1 = new Date(1,1,2001);
        Date d2 = d1;
        if(d1 == d2)
            System.out.println("References are equal");
        else
            System.out.println("References are not Equal");
    }
}
