package p1;

public class Program03 {
    public static void main(String[] args) {
//        int[] arr = new int[5];
//        arr[0] = 10;
//        arr[1] = 20;
//        arr[2] = 30;
//        arr[3] = 40;
//        arr[4] = 50;


//        int [] arr = new int[]{10,20,30,40,50};

        int [] arr = {10,20,30,40,50};

        // index based for-loop
        System.out.println("Index based for-loop");
        for (int i=0;i<arr.length;i++){
            int element = arr[i];
            System.out.println("Element - "+element);
        }

        // index based for-each
        System.out.println("Index based for-each");
        for(int element:arr)
            System.out.println("Element - "+element);
    }
}
