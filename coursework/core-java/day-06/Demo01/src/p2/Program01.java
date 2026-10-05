package p2;

import java.sql.SQLException;

class Parent{
    Number method1()  {
        System.out.println("Person::method1()");
        return  1;
    }
}

class Child extends Parent{
    @Override
    public Integer method1()  {
        System.out.println("Child::method1()");
        return 1;
    }
}
public class Program01 {
}
