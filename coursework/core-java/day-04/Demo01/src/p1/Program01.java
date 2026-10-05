package p1;

// Array for primitive types
public class Program01 {
    public static void main(String[] args) {
        int[] arr; // reference
        arr = new int[5]; // object
        arr[0] = 10;
        arr[1] = 20;
        arr[2] = 30;
        arr[3] = 40;
        arr[4] = 50;

        // index based for-loop
        for (int i=0;i<arr.length;i++)
            System.out.println(arr[i]);
    }
}
