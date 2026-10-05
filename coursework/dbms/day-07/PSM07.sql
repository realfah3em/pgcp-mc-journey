-- Create a procedure to accept a number and print its table
-- using the repeat loop
-- insert the table into the result table.

DROP PROCEDURE IF EXISTS num_table;

DELIMITER $$

CREATE PROCEDURE num_table(IN v_num INT)
BEGIN

    DECLARE v_i INT DEFAULT 1;

    REPEAT 
        INSERT INTO result VALUES(v_num,CONCAT(v_num,' * ',v_i,' = ',v_num*v_i));
        -- 5 * 1 = 5
        SET v_i = v_i + 1;
        UNTIL v_i > 10
    END REPEAT; 
END;

$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM07.sql
-- TRUNCATE result;
-- CALL num_table(15);
-- SELECT * FROM result;