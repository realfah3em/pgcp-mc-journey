package p2;

public class Progarm01 {
    public static void main(String[] args) {
        int[][] arr = new int[2][3];

        arr[0][0] = 10;
        arr[0][1] = 20;
        arr[0][2] = 30;
        arr[1][0] = 40;
        arr[1][1] = 50;
        arr[1][2] = 60;

        //
        for (int i = 0; i < arr.length; i++)
            for (int j = 0; j < arr[i].length; j++)
                System.out.println(arr[i][j]);

        System.out.println("-----------------------------");


        for (int i = 0; i < arr.length; i++) {
            int[] elements = arr[i];
            for (int j = 0; j < elements.length; j++) {
                int e = elements[j];
                System.out.println(arr[i][j]);
            }
        }

        System.out.println("-----------------------------");
        for (int[] innerarr : arr)
            for (int e:innerarr)
                System.out.println(e);
    }
}
