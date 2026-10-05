public class Program01 {
    public static void main(String[] args) {
       boolean status = false;
       // boolean value in java cannot be converted to any other type
       // int n1 = (int)status;

        char ch = 'A';
        int n1 = ch; // widening
        double n2 = ch; // widening
        short n3 = (short)ch;

        int n4 = 67;
        char ch2 = (char)n4; // narrowing

        double n5 = 65.23;
        char ch3 = (char)n5;


    }
}
