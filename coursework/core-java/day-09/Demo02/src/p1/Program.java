package p1;

class Box{
    private Object obj;

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public Object getObj() {
        return obj;
    }
}

public class Program {
    public static void main(String[] args) {
        Box b1 = new Box();
        b1.setObj(10);
        b1.setObj("sunbeam");
        Integer i1 =(Integer) b1.getObj();
        System.out.println(i1);

        Box b2 = new Box();
        b2.setObj("sunbeam");
    }
}
