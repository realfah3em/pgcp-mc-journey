package p2;
import java.util.Scanner;

class Student{
    int rollno;
    String name;
    double percentage;

    public void acceptStudent(Scanner sc){
        System.out.print("Enter the rollno - ");
        rollno = sc.nextInt();
        System.out.print("Enter the name - ");
        name = sc.next();
        System.out.print("Enter the percentage - ");
        percentage = sc.nextDouble();
    }

    public void displayStudent(){
        System.out.println("Rollno - "+rollno);
        System.out.println("Name - "+name);
        System.out.println("Percentage - "+percentage);
        System.out.println("--------------------------");
    }
}



public class Program {
    public static int menu(Scanner sc){
        System.out.println("0. Exit");
        System.out.println("1. Add Student");
        System.out.println("2. Display all students");
        System.out.print("Enter your choice - ");
        int choice = sc.nextInt();
        System.out.println("---------------------------------");
        return  choice;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Student[] arr =  new Student[5];
        int index = 0;
        int choice;
        while ((choice = menu(sc))!=0){
           switch (choice){
               case 1:
                   if(index< arr.length) {
                       arr[index] = new Student();
                       arr[index].acceptStudent(sc);
                       index++;
                   }
                   else
                       System.out.println("Intake is full");
                   break;
               case 2:
                    for (Student s:arr)
                        if(s!=null)
                            s.displayStudent();
                   break;
               default:
                   System.out.println("Invalid choice...");
                   break;
           }
        }
    }
}
