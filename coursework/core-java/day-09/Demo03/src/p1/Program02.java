package p1;

public class Program02 {
    public static <T>void displayArray(T []arr){
        for(T e:arr)
            System.out.println("Element - "+e);
    }

    public static void main(String[] args) {
        Integer []arr1 = {1,2,3,4,5,6,7,8,9,10};
        Double[] arr2 = {11.22,22.33,33.44,44.55,55.66};
        String[] arr3 = {"Anil","Mukesh","Ramesh","Suresh","Ram","Sham"};

        displayArray(arr1);
        displayArray(arr2);
        displayArray(arr3);
    }
}
