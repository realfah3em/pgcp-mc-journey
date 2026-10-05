/*
find emp name with max and min sal and store the names into
result table with their sal values.
*/

DROP PROCEDURE IF EXISTS max_min_sal;

DELIMITER $$

CREATE PROCEDURE max_min_sal()
BEGIN
    DECLARE v_name VARCHAR(30);
    DECLARE v_sal DOUBLE;

    SELECT ename,sal INTO v_name,v_sal FROM emp
    ORDER BY sal DESC 
    LIMIT 1;
    INSERT INTO result VALUES(1,CONCAT(v_name,' - ',v_sal));

    SELECT ename,sal INTO v_name,v_sal
    FROM emp
    ORDER BY sal ASC 
    LIMIT 1;
    INSERT INTO result VALUES(2,CONCAT(v_name,' - ',v_sal));

END;
$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/PGMC_DBT/Day07/PSM04.sql

-- TRUNCATE result;
-- CALL max_min_sal();
-- SELECT * FROM result;