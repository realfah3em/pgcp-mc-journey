package p3;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class Program04 {
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

        // Anonymous class
        Comparator<Product> comparator= new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return o1.pid-o2.pid;
            }
        };
        products.sort(comparator);
        display(products);
    }
}
