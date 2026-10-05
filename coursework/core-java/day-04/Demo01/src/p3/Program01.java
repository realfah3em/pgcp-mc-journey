package p3;

public class Program01 {
    public static void add(int[] arr){
        int res =0;
        for(int e:arr)
            res+=e;
        System.out.println("Addition - "+res);
    }
    public static void main(String[] args) {
        int[] arr1 = {10,20};
        add(arr1);
        int [] arr2 = {10,20,30};
        add(arr2);
        int [] arr3 = {10,20,30,40};
        add(arr3);
        int [] arr4 = {10,20,30,40,50};
        add(arr4);
    }
}
