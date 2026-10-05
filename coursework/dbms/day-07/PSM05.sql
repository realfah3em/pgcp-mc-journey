/*
 Perform addition of even numbers in a given range 
(passed as parameter). display the result on the CLI.
*/

DROP PROCEDURE IF EXISTS sum_even_nos;

DELIMITER $$

CREATE PROCEDURE sum_even_nos(v_low  INT, v_high INT)
BEGIN
    DECLARE v_i INT DEFAULT v_low; -- loop variable initalization
    DECLARE v_sum INT DEFAULT 0;

    WHILE v_i <= v_high DO  -- condition check
            IF v_i % 2 = 0 THEN    -- loop body
                SET v_sum = v_sum + v_i;
            END IF;
        SET v_i = v_i + 1;    -- loop variable modification
    END WHILE;
    SELECT v_low AS lower_range,v_high AS higher_range,v_sum AS result;
END;
$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM05.sql
-- CALL sum_even_nos(1,10);
-- CALL sum_even_nos(25,75);
