package p2;

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
    public static void main(String[] args) {
        Box<Integer> b1 = new Box<Integer>();
        b1.setObj(10);
        //b1.setObj("sunbeam"); // NOT OK
        Integer i1 = b1.getObj();
        System.out.println(i1);

        Box<String> b2 = new Box<>();
        b2.setObj("sunbeam");
        String s1  = b2.getObj();
        System.out.println(s1);

        Box<Date> b3 = new Box<Date>();
        b3.setObj(new Date());
        Date i2 = b3.getObj();
        System.out.println(i2);
    }
}
