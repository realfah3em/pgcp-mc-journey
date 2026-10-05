-- Create a procedure to accept a number as parameter 
-- and return the square of that number 
-- from another parameter from the procedure. 

DROP PROCEDURE IF EXISTS sqr;

DELIMITER $$

CREATE PROCEDURE sqr(IN v_num INT,OUT v_res INT)
BEGIN
   SET v_res = v_num * v_num;
END;
$$
DELIMITER ;


-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM08.sql
-- SET @num = 5;
-- SET @res = 0;

-- CALL sqr(@num,@res);

-- SELECT @num AS num, @res AS result;


