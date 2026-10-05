package p2;
interface Displayble{
    default void display(){
        System.out.println("Displayble::display");
    }
}

interface Printable{
    default void display(){
        System.out.println("Printable::display");
    }
}

class SuperTest {
    public void display(){
        System.out.println("SuperTest::display");
    }
}

class Test extends SuperTest implements Displayble,Printable{
    @Override
    public void display() {
        super.display();
        Displayble.super.display();
        Printable.super.display();
        System.out.println("Test::display");
    }
}
public class Program01 {
    public static void main(String[] args) {
        Test t1 = new Test();
        t1.display();
    }
}
