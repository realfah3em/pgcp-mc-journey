package p5;

import java.util.Arrays;

class Product implements Comparable<Product> {
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
//        return this.pid-o.pid;
//        return this.name.compareTo(o.name);
        return Double.compare(o.price,this.price);
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

//        System.out.println("All the products Sorted on pid ->");
//        System.out.println("All the products Sorted on name ->");
        System.out.println("All the products Sorted on price in desc order ->");
        // Natural ordering of the elements
        Arrays.sort(arr);
        for (Product p:arr)
            System.out.println(p);



    }
}
