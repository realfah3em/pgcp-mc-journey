package p1;

public class Time {
   // data security -> data validation
    private int hr;
    private int min;

    // facilitator
    public void display(){
        System.out.println("Hr - "+hr);
        System.out.println("Min - "+min);
    }

    // setter-write
    public void setHr(int hr){
        if(hr>0 && hr<24)
            this.hr = hr;
    }

    //setters
    public void setMin(int min){
        if(min>0 && min<60)
            this.min = min;
    }

    // getter
    public int getMin(){
        return min;
    }

    // getter- read
    public int getHr(){
        return hr;
    }

}
