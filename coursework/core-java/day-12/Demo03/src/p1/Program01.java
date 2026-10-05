package p1;

import java.util.ArrayList;
import java.util.List;

public class Program01 {

    @Override // Marker Annotation
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    @SuppressWarnings("unused")
    public static void main(String[] args) {
        //@SuppressWarnings("unused") // single value annotation
        int n1 = 10;

        @SuppressWarnings(value = "rawtypes")
        List l1 = new ArrayList();


    }
}
