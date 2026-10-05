DROP TRIGGER IF EXISTS trig1;

DELIMITER $$

CREATE TRIGGER trig1
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE v_id INT;
    DECLARE v_type VARCHAR(20);
    DECLARE v_amt DECIMAL(9,2);

    SET v_id = NEW.acc_id;
    SET v_type = NEW.tran_type;
    SET v_amt = NEW.amount;

    IF v_type = 'DEPOSIT' THEN 
        UPDATE accounts SET balance = balance + v_amt
        WHERE acc_id = v_id;
    ELSE
        UPDATE accounts SET balance = balance - v_amt
        WHERE acc_id = v_id;
    END IF;
END;
$$
 DELIMITER ;


-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/trig01.sql
 -- INSERT INTO transactions VALUES(1,'DEPOSIT',NOW(),5000);
-- INSERT INTO transactions VALUES(5,'WITHDRAW',NOW(),2000);
