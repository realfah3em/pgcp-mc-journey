package p1;

public class Student{
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
    public String toString() {
        return "Student{" +
                "rollno=" + rollno +
                ", name='" + name + '\'' +
                ", percentage=" + percentage +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if(obj==null)
            return false;
        if(this==obj)
            return  true;
        if(obj instanceof Student){
            Student s = (Student) obj;
            return this.rollno == s.rollno;
        }
        return false;
    }
}
