package p3;

public class Program02 {
    // arity operator (...)
    // variable argument/arity method
    public static void add(int... arr){
        int res =0;
        for(int e:arr)
            res+=e;
        System.out.println("Addition - "+res);
    }
    public static void main(String[] args) {
        add(10,20);
        add(10,20,30);
        //int [] arr3 = {10,20,30,40};
        add(10,20,30,40);
        add(10,20,30,40,50);
    }
}
