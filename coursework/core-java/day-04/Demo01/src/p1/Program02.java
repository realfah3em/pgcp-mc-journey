package p1;
class Test{
    void display(){
        System.out.println("Test::display");
    }
}
public class Program02 {
    public static void main(String[] args) {
        //Test t1 = null;
        //t1.display(); // NullPointerException

        // int[] arr = null;
        //System.out.println(arr);
        //System.out.println(arr[0]); // NullPointerException


        //int[] arr = new int[-2]; // NegativeArraySizeException
        int[] arr = new int[2];
         arr[0] = 10;
         arr[1] = 20;
        System.out.println(arr[0]);
        // System.out.println(arr[4]); // ArrayIndexOutOfBoundsException
        System.out.println(arr[-1]); // ArrayIndexOutOfBoundsException
    }
}
