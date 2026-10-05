-- Write a function to display the experience of emps
-- in months.

DROP FUNCTION IF EXISTS exp_in_months;

DELIMITER $$

CREATE FUNCTION exp_in_months(dt DATE)
RETURNS INT
NOT DETERMINISTIC
BEGIN
    DECLARE v_res INT DEFAULT 0;
    SET v_res = TIMESTAMPDIFF(MONTH,dt,NOW());
    RETURN v_res;
END;
$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM11.sql
-- SELECT exp_in_months('2020-01-10') AS exp;

-- SELECT empno,ename,hire,exp_in_months(hire) AS exp FROM emp;