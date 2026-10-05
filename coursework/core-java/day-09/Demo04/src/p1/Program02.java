package p1;

import java.util.Scanner;

enum Operations{
    EXIT,ADD,DISPLAY,SORT,DELETE,UPDATE,DEPARTMENTWISE_LIST
}

public class Program02 {
    public static Operations menu(Scanner sc){
        Operations choice;
        Operations[]arr = Operations.values();
        for(Operations e:arr)
            System.out.println(e.ordinal()+". "+e.name());

        System.out.print("Enter your choice - ");
        return arr[sc.nextInt()];
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Operations choice;
        while ((choice=menu(sc))!=Operations.EXIT){
            switch (choice){
                case ADD:
                    break;

                case DISPLAY:
                    break;

                case SORT:
                    break;

                case UPDATE:
                    break;

                case DELETE:
                    break;

                case DEPARTMENTWISE_LIST:
                    break;

            }
        }

    }
}
