package p2;

public class Program01 {

    public static void delay(){
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        BankAccount a1 =  new BankAccount(101, 10000);

        class DepositThread extends Thread{
            @Override
            public void run() {
                for (int i = 0; i <10 ; i++) {
                   a1.deposit(10000);
                   System.out.println("Balance after Deposit - "+a1.balance);
                   delay();
                }
            }
        }

        class WithdrawThread extends Thread{
            @Override
            public void run() {
                for (int i = 0; i <10 ; i++) {
                    a1.withdraw(10000);
                    System.out.println("Balance after withdraw - "+a1.balance);
                    delay();
                }
            }
        }

        DepositThread dt = new DepositThread();
        WithdrawThread wt = new WithdrawThread();

        dt.start();
        wt.start();

        try {
        // join
            dt.join();
            wt.join();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        System.out.println("Final Balance of the day - "+a1.balance);

    }
}
