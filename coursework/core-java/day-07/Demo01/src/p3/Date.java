package p3;

public class Date{
int day;
int month;
int year;

Date(){

}

public Date(int day, int month, int year) {
    this.day = day;
    this.month = month;
    this.year = year;
}

    @Override
    public boolean equals(Object obj)
    {
        // this = d1
        // obj = d2
        // d1.day==d2.day && d1.month==d2.month && d1.year == d2.year
        Date d =(Date) obj; // Downcasting
        if(this.day == d.day && this.month==d.month && this.year == d.year)
            return  true;
        return false;
    }

    @Override
public String toString() {
    return "Date{" +
            "day=" + day +
            ", month=" + month +
            ", year=" + year +
            '}';
}
}