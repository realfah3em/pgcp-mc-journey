package p4;

class Date{
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
    public String toString() {
        return "Date{" +
                "day=" + day +
                ", month=" + month +
                ", year=" + year +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if(obj == null)
            return false;
        if(this==obj)
            return true;
        if(obj instanceof Date) {
            Date d = (Date) obj;
            if (this.day == d.day && this.month == d.month && this.year == d.year)
                return true;
        }
        return false;
    }
}

public class Program {
    public static void main(String[] args) {
        Date d1 = new Date(1,1,2001);
        Date d2 = new Date(1,1,2001);
        Date d3 = new Date(1,1,2001);

        if(d1.equals(new String("sunbeam")))
            System.out.println("States are equal");
        else
            System.out.println("States are not Equal");
    }
}
