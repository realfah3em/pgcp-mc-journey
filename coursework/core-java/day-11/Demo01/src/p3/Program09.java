package p3;

import java.util.*;

public class Program09 {
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

        // multi-liner lambda
        // using {} is compulsary
        products.sort((p1,p2)->{
           int diff =  p1.pid-p2.pid;
           return diff;
        });

        // single-liner lambda
        // using {} and return is optional
        products.sort((p1,p2)->p1.pid-p2.pid);

        display(products);



    }
}
