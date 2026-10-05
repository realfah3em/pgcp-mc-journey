package p6;

import java.util.Arrays;
import java.util.Comparator;

class Product implements Comparable<Product>  {
    int pid;
    String name;
    double price;

    Product(){

    }

    public Product(int pid, String name, double price) {
        this.pid = pid;
        this.name = name;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }


    @Override
    public int compareTo(Product o) {
        // natural ordering of the elements
        return this.pid-o.pid;
    }
}
public class Program {
    public static void main(String[] args) {
        Product[] arr = new Product[5];
        arr[0] = new Product(5,"Book",50);
        arr[1] = new Product(1,"Pen",30);
        arr[2] = new Product(4,"Pencil",10);
        arr[3] = new Product(2,"Crayons",100);
        arr[4] = new Product(3,"Eraser",5);

        System.out.println("All the products unsorted ->");
        for (Product p:arr)
            System.out.println(p);

        System.out.println();
        System.out.println("All the products Sorted on natural ordering ->");
        Arrays.sort(arr);
        for (Product p:arr)
            System.out.println(p);

        System.out.println();
        class ProductNameComparator implements Comparator<Product>{
            @Override
            public int compare(Product p1, Product p2) {
                return p1.name.compareTo(p2.name);
            }
        }
        ProductNameComparator productNameComparator = new ProductNameComparator();
        System.out.println("All the products Sorted on names  ->");
        Arrays.sort(arr, productNameComparator);
        for (Product p : arr)
            System.out.println(p);
        // to sort the array on any other order other than the natural order use the comparator

        System.out.println();
        class ProductPriceComparator implements Comparator<Product>{
            @Override
            public int compare(Product p1, Product p2) {
                return Double.compare(p2.price,p1.price);
            }
        }
        System.out.println("All the products Sorted on price in desc  ->");
        Arrays.sort(arr, new ProductPriceComparator()); // anonymous object
        for (Product p:arr)
            System.out.println(p);
    }
}
