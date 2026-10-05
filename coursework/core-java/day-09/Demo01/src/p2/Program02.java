package p2;

public class Program02 {
    public static void main(String[] args) {
        //StringBuffer sb1 = "sunbeam"; // NOT OK
        //StringBuilder sb1 = "sunbeam";// NOT OK

        StringBuilder sb1 = new StringBuilder("sunbeam");
        sb1.append(" infotech"); // stingbuffer objects are mutable
        StringBuilder sb2 = new StringBuilder("sunbeam");
        System.out.println("sb1 - "+sb1);
        System.out.println("sb1 - "+sb2);
        System.out.println("sb1==sb2 - "+(sb1==sb2));

    }
}
