package p3;

import java.util.Date;
// generic class -> Generics
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
    public static void main(String[] args) {
      Box<Integer> b1 = new Box<Integer>();
      b1.setObj(10);

      Box<Double> b2 = new Box<>();
      b2.setObj(11.22);

      Box<String>b3 = new Box(); // Object created is a raw type
      b3.setObj("sunbeam");
      //b3.setObj(new Date()); // NOT OK

        Box b4 = new Box();
        b4.setObj(10);
        b4.setObj(11.22);
        b4.setObj("sunbeam");
        b4.setObj(new Date());
    }
}
