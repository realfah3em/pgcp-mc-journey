 -- Display area and circumference of circle.
-- consider radius as 7.

DROP PROCEDURE IF EXISTS area_circum;


DELIMITER $$
CREATE PROCEDURE area_circum(radius DOUBLE)
BEGIN
    DECLARE v_area DOUBLE DEFAULT 0.0;
    DECLARE v_circum DOUBLE DEFAULT 0.0;
    SET v_area = 3.142 * radius * radius;
    SET v_circum = 2 * 3.142 * radius;

    SELECT radius,v_area AS area , v_circum AS circumference;

END;
$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM03.sql
-- CALL area_circum(7);
