package p6;

import java.util.Date;
class Box<T>{
    private T obj;

    public void setObj(T obj) {
        this.obj = obj;
    }

    public T getObj() {
        return obj;
    }
}

public class Program {

    // restrictions on the unbounded type parameter
    // upper bound
//    public static void display(Box<? extends Number> b){
//        System.out.println("Value - "+b.getObj());
//    }

    // lower bound
    public static void display(Box<? super Integer> b){
        System.out.println("Value - "+b.getObj());
    }

    public static void main(String[] args) {
      Box<Integer> b1 = new Box<Integer>();
      b1.setObj(10);

      Box<Double> b2 = new Box<>();
      b2.setObj(11.22);

      Box<String>b3 = new Box();
      b3.setObj("sunbeam");

      Box<Date>b4 = new Box();
      b4.setObj(new Date());

        //Box<Object> b = new Box<String>();
        Box<Number> b = new Box<Number>();

        display(b1);
        //display(b2);
        //display(b3);
        //display(b4);

    }
}
