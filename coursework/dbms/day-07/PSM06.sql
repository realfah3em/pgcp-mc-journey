/*
Accept a number as argument and check if its prime or not.
Insert the result into the result table.
*/

DROP PROCEDURE IF EXISTS prime_no;

DELIMITER $$

CREATE PROCEDURE prime_no(v_num INT)
BEGIN
    DECLARE v_i INT DEFAULT 2;

    prime: LOOP 
        IF v_num = v_i THEN
            INSERT INTO result VALUES(v_num,"PRIME");
            LEAVE prime;
        END IF;

        IF v_num % v_i = 0 THEN 
            INSERT INTO result VALUES(v_num,"NOT PRIME");
            LEAVE prime;
        END IF;
        SET v_i = v_i + 1;

    END LOOP; 

END;
$$

DELIMITER ;
-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM06.sql
-- TRUNCATE result;
-- CALL prime_no(45);
-- CALL prime_no(71);
-- CALL prime_no(32);
-- CALL prime_no(13);
-- SELECT * FROM result;
