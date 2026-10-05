package com.sunbeam.sms.utils;

import java.util.Scanner;

// singeton design pattern
public class ScannerClient {
    private static Scanner sc = null;
    private  ScannerClient(){
    }
    public static Scanner getInstance(){
        if(sc==null)
            sc = new Scanner(System.in);
        return sc;
    }
}
