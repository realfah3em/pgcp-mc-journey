DROP PROCEDURE IF EXISTS hello;
DELIMITER $$
CREATE PROCEDURE hello()
BEGIN
    SELECT "Hello everyone ! " AS msg;
END;
$$

DELIMITER ;


-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM01.sql
-- CALL hello();