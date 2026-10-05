package p2;

import java.util.stream.Stream;

public class Program05 {
    public static void main(String[] args) {
//        Integer arr[] = {1,2,3,4,5,6,7,8,9,};
//        Integer res = 0;
//        for(Integer e:arr){
//            res= res + e;
//        }
//        System.out.println(res);

    Integer res =  Stream.of(1,2,3,4,5,6,7,8,9).reduce(0,(x,y)->x+y);
    System.out.println("Result - "+res);
    }
}
