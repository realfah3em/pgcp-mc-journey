package com.sunbeam.demo04.exceptions;

public class EmployeeException extends  Exception{
    public EmployeeException(){
    }
    public EmployeeException(String message){
        super(message);
    }
}
