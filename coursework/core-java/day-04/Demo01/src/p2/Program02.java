package p2;

public class Program02 {
    public static void main(String[] args) {
        // ragged array
        int[][] arr = new int[2][];
        arr[0] = new int[3];
        arr[1] = new int[2];

        arr[0][0] = 10;
        arr[0][1] = 20;
        arr[0][2] = 30;
        arr[1][0] = 40;
        arr[1][1] = 50;
        //arr[1][2] = 60; // ArrayIndexOutOfBoundsException

        for(int []elements:arr)
            for(int e:elements)
                System.out.println(e);
    }
}
