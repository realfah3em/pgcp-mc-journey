package p2;

import p1.Test;

// is-a relationship -> inheritance
// TestChild -> subclass
public class TestChild extends Test {
    public void displayTestChild(){
//        System.out.println(n1);// NOT OK
//        System.out.println(n2);// NOT OK
        System.out.println(n3);//  OK
        System.out.println(n4);//  OK

    }
}
