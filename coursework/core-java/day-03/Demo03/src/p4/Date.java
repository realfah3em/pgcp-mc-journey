package p4;

public class Date {
    int day;
    int month;
    int year;

    public Date(){
        this(1,1,2000); // this statement -> Constructor chaining
        System.out.println("Inside Ctor");
    }

    public Date(int day,int month, int year){
        this.day = day;
        this.month = month;
        this.year = year;
    }

    public void displayDate(){
        System.out.println("Date - "+day+"/"+month+"/"+year);
    }
}
