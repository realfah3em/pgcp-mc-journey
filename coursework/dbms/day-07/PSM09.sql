-- create a procedure to accept a number and return the square
-- from the same parameter.

DROP PROCEDURE IF EXISTS sqr2;

DELIMITER $$

CREATE PROCEDURE sqr2(INOUT v_num INT)
BEGIN
    SET v_num = v_num * v_num;
END;
$$
DELIMITER ;

-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM09.sql
-- SET @res = 7;
-- CALL sqr2(@res);
-- SELECT @res;
