package p3;

import java.util.ArrayList;
import java.util.List;

public class Program08 {
    public static void display(List<Product> products){
        for (Product p:products)
            System.out.println(p);
        System.out.println("---------------------------------------");
    }
    public static void main(String[] args) {
        List<Product> products= new ArrayList<>();
        products.add(new Product(5,"Book",50));
        products.add(new Product(1,"Pen",120));
        products.add(new Product(4,"Pencil",10));
        products.add(new Product(2,"Crayons",50));
        products.add(new Product(3,"Eraser",15));

        System.out.println("Unsorted Products -> ");
        display(products);

        System.out.println("Products Sorted on Pid -> ");
        products.sort((p1,p2)->p1.pid-p2.pid);
        display(products);

        System.out.println("Products Sorted on name -> ");
        products.sort((p1,p2)->p1.name.compareTo(p2.name));
        display(products);

        System.out.println("Products Sorted on price in desc -> ");
        products.sort((p1,p2)->Double.compare(p2.price,p1.price));
        display(products);

    }
}
