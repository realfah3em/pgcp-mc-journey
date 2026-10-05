package p1;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Field;

// Marker Annotation
@Retention(RetentionPolicy.CLASS)
@Target({ElementType.TYPE, ElementType.FIELD, ElementType.CONSTRUCTOR,ElementType.METHOD})
@interface MarkerAnnotation {
}

// Single Value Annotation
@Target(ElementType.METHOD)
@interface SingleValueAnnotation{
    //String value();
    String[] value();
}

// Multi Value Annotations
@interface MultiValueAnnotation{
    String name();
    String dept();
}

@MultiValueAnnotation(name = "Rohan", dept = "DEV")
@MarkerAnnotation
class Test{


    @MarkerAnnotation
    int n1;

    @MarkerAnnotation
    Test(){

    }

    @SingleValueAnnotation({"value1","value2"})
    @MarkerAnnotation
    void method1(){

    }
}

public class Program02 {
}
