package p3;
class Singleton{
    // step 2: declare a field which is static reference of this class
    private static Singleton ref ;

    // step 1 : Make the ctor private
    private Singleton() {
        System.out.println("Inside Ctor");
    }

    public static Singleton getInstance(){
        if(ref == null)
            ref = new Singleton();
        return ref;
    }
}

public class Program01 {
    public static void main(String[] args) {
        Singleton s1 = Singleton.getInstance();
        Singleton s2 = Singleton.getInstance();
        Singleton s3 = Singleton.getInstance();
        Singleton s4 = Singleton.getInstance();
        Singleton s5 = Singleton.getInstance();
    }
}
