package p4;

import java.util.Date;

// Bounded type parameter
class Box<T extends Number>{
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
        Box<Number> b = new Box<>();
        Box<Integer> b1 =  new Box<>();
        Box<Double> b2 = new Box<>();

        // Box<String> b3 =  new Box<String>();// NOT OK
    }
}
