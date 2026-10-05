-- write a function to add two decimal values.
-- if any input is null, consider it as 0.

DROP FUNCTION IF EXISTS addition;

DELIMITER $$

CREATE FUNCTION addition(v_num1 DECIMAL(9,2),v_num2 DECIMAL(9,2))
RETURNS DECIMAL(9,2)
DETERMINISTIC
BEGIN
    DECLARE result DECIMAL(9,2) DEFAULT 0.0;
    SET result = IFNULL(v_num1,0) + IFNULL(v_num2,0);
    RETURN result;
END;
$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM10.sql
-- SELECT addition(12,567);
-- SELECT addition(NULL,500);
-- SELECT empno,ename,sal,comm,addition(sal,comm) AS total_sal FROM emp;


