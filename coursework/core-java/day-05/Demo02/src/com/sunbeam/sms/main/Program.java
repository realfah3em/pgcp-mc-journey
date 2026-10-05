package com.sunbeam.sms.main;

import com.sunbeam.sms.entity.Student;
import com.sunbeam.sms.utils.ScannerClient;

public class Program {
    private static int index = 0;

    public static int menu(){
        System.out.println("0.EXIT");
        System.out.println("1.Add Student");
        System.out.println("2.Display all students");
        System.out.print("Enter your choice - ");
        int choice = ScannerClient.getInstance().nextInt();
        System.out.println("-------------------------------------");
        return choice;
    }

    public static void addStudent(Student[] arr){
        if(index<arr.length){
            arr[index] = new Student();
            arr[index].acceptStudent();
            index++;
        }else
            System.out.println("Intake full...");
    }

    public static void displayAllStudents(Student[] arr){
        for (Student s : arr)
            if(s!=null)
                s.displayStudent();
    }

    public static void main(String[] args) {
        Student [] arr = new Student[5];
        int choice;
        while ((choice=menu())!=0){
            switch (choice){
                case 1:
                    addStudent(arr);
                    break;
                case 2:
                    displayAllStudents(arr);
                    break;
                default:
                    System.out.println("Invalid choice...");
                    break;
            }
        }

    }
}
