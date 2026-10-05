package p2;

class Student implements Cloneable{
    int rollno;
    String name;
    double percentage;

    Student(){
    }

    public Student(int rollno, String name, double percentage) {
        this.rollno = rollno;
        this.name = name;
        this.percentage = percentage;
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    @Override
    public String toString() {
        return "Student{" +
                "rollno=" + rollno +
                ", name='" + name + '\'' +
                ", percentage=" + percentage +
                '}';
    }
}

public class Program {
    //
    public static void main(String[] args)  {
        try{
            Student s1 = new Student(1,"Anil",60);
            Student s2 = (Student) s1.clone(); // Downcasting // clone of s1
            System.out.println("s1 - "+s1);
            System.out.println("s2 - "+s2);

            s2.rollno = 2;
            System.out.println("After change in s2.rollno");
            System.out.println("s1 - "+s1);
            System.out.println("s2 - "+s2);
        }catch (CloneNotSupportedException e){
            e.printStackTrace();
        }

    }
}
