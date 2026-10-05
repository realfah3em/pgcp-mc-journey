package p3;

public class BankAccount {
    int accno;
    double balance;

    BankAccount(){

    }

    public BankAccount(int accno, double balance) {
        this.accno = accno;
        this.balance = balance;
    }

    public synchronized void deposit(double amount){
        double newBalance = balance + amount;
        balance = newBalance;
    }
    public synchronized void withdraw(double amount){
        double newBalance = balance - amount;
        balance = newBalance;
    }
}
