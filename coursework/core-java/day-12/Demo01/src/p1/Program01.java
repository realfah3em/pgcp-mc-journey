package p1;

public class Program01 {
    public static void main(String[] args) {
        // display square of even numbers prefixed with Java
        Integer[] arr = {1,2,3,4,5,6};
        for(Integer e:arr){
            if(e%2==0){ // op-1 : filter()
                Integer sq = e * e; // op-2
                String res = "Java"+sq; // op-3
                System.out.println(res); // op-4 :
            }
        }
    }
}
