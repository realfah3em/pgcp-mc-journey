package p2;

class Product implements Comparable<Product>{
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


//    @Override
//    public int compareTo(Product obj) {
//       //this -> p1
//        // obj -> p2
//        if(this.pid>obj.pid)
//            return 5;
//        if(this.pid<obj.pid)
//            return -2;
//        return 0;
//    }

    @Override
    public int compareTo(Product obj) {
       return this.pid - obj.pid;
    }
}
public class Program {
    public static void main(String[] args) {
        Product p1 = new Product(1,"Pen",20);
        Product p2 = new Product(2,"Book",50);
        if(p1.compareTo(p2)>0)
            System.out.println("p1 is greater");
        else if(p1.compareTo(p2)<0)
            System.out.println("p2 is greater");
        else
            System.out.println("Both are equal");


    }
}
