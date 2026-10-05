package p1;
class Date{
    private int day;
    private int month;

    public void setDay(int day) throws Exception {
            if (day < 1 || day > 31)
                throw new Exception(); // generate checked Exception
            this.day = day;

    }

    public void setMonth(int month) throws Exception {
        if(month<1 || month>12)
//            throw new Exception();
            throw new Exception("month should be between 1 and 12");
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
            d1.setDay(25); // day>0, day<32
            d1.setMonth(16); // mon>0, mon<13
            System.out.println(d1);
        } catch (Exception e) {
          e.printStackTrace();
        }

        System.out.println("Proggram finished successfully");
    }
}
