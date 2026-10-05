package p2;

// checked exception
class InvalidDateException extends Exception{
    public InvalidDateException(){
    }
    public InvalidDateException(String message){
        super(message);
    }
}

class Date{
    private int day;
    private int month;

    public void setDay(int day) throws InvalidDateException {
            if (day < 1 || day > 31)
                throw new InvalidDateException(); // generate checked Exception
            this.day = day;

    }

    public void setMonth(int month) throws  InvalidDateException {
        if(month<1 || month>12)
            throw new InvalidDateException("month should be between 1 and 12");
        this.month = month;
    }

    @Override
    public String toString() {
        return "Date{" +
                "day=" + day +
                ", month=" + month +
                '}';
    }
}
public class Program02 {
    public static void main(String[] args) {
        Date d1 = new Date();
        try {
            d1.setDay(15); // day>0, day<32
            d1.setMonth(16); // mon>0, mon<13
            System.out.println(d1);
        }catch (InvalidDateException e){
            e.printStackTrace();
        }
        System.out.println("Proggram finished successfully");
    }
}
