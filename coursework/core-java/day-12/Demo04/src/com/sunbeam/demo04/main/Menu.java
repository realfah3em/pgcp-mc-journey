package com.sunbeam.demo04.main;

import com.sunbeam.demo04.entity.Employee;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Menu {
    private static int mainMenuOptions(Scanner sc){
        System.out.println("0. EXIT");
        System.out.println("1. Add Employee");
        System.out.println("2. Display All Employees");
        System.out.println("3. Find Employee");
        System.out.println("4. Sort employees on salary desc order ");
        System.out.print("Enter Your Choice - ");
        int choice = sc.nextInt();
        System.out.println("-------------------------------------------");
        return  choice;
    }

    public static void mainMenu(){
        int choice;
        List<Employee> employees = new ArrayList<>();
        try(Scanner sc = new Scanner(System.in)){
            while((choice = mainMenuOptions(sc))!=0){
                switch (choice){
                    case 1:
                        Employee e = new Employee();
                        e.accept(sc);
                        employees.add(e);
                        break;
                    case 2:
                        employees.forEach(e1->e1.display());
                        break;
                    case 3:
                    {
                        System.out.print("Enete the empid to search - ");
                        Employee e2 = new Employee(sc.nextInt());
                        int index = employees.indexOf(e2);
                        if(index!=-1)
                            employees.get(index).display();
                        else
                            System.out.println("Employee not found...");
                    }
                        break;
                    case 4:
                        employees.stream()
                                .sorted((o1,o2)->Double.compare(o2.getSalary(),o1.getSalary()))
                                .forEach(o->o.display());
                        break;
                    default:
                        System.out.println("invalid Choice .. :(");
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
