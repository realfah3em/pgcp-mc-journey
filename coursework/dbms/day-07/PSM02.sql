/*
Create a procedure to insert a msg into the result table, 
accept a name as a parameter.
msg : Hello 'name' (passed as a parameter)
*/

DROP PROCEDURE IF EXISTS hello2;

DELIMITER ##
CREATE PROCEDURE hello2(name VARCHAR(30))
BEGIN
    DECLARE msg VARCHAR(50);
    SET msg = CONCAT('Hello ',name);
    INSERT INTO result VALUES(1,msg);
END;
##

DELIMITER ;

-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM02.sql

-- CALL hello2('Sunbeam');
-- SELECT * FROM result;

-- CALL hello2('Nisha');