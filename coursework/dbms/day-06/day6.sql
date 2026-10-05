/*
AGENDA :
    Subqueries :
        Single Row Subqueries
        Multi Row Subqueries
        Co-related Subqueries
        Sub-queries in DML
        Sub-queries in projection
        Sub-queries in FROM clause

    Views :
*/


--__________________________subqueries_________________________________
/*
Sub-queries : Nested Queries : Query inside query.
Most of the times The inner query is executed first sending the output 
to the outer query.
The outer query uses the output sent by inner query and executes.
Maximum times the sub-queries are SELECT inside SELECT.
*/

-- Single Row Sub-Queries :
 -- Return single value from the inner query to the outer query.
 -- They are combined with the relational ops : <, <=, >, >=, =, <>,!=


-- Display Max salary of emp From emp table.
SELECT MAX(sal) FROM emp;


SELECT empno,ename,deptno,sal
FROM emp
WHERE sal = MAX(sal);
-- Error


-- Display the details of emp earning the max sal.
-- using variable

SET @max_sal = (SELECT MAX(sal) FROM emp);
SELECT @max_sal;

SELECT empno,ename,deptno,sal 
FROM emp
WHERE sal = @max_sal;

+-------+-------+--------+---------+
| empno | ename | deptno | sal     |
+-------+-------+--------+---------+
|  7839 | KING  |     10 | 5000.00 |
+-------+-------+--------+---------+

-- Sub-query

SELECT empno,ename,deptno,sal
FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp);



-- _________________________________________
-- Display the emp with 2nd highest salary

SELECT empno,ename,sal
FROM emp
ORDER BY sal DESC 
LIMIT 1,1;
-- No Proper output

-- using variable

SET @sal2 = (SELECT DISTINCT sal FROM emp ORDER BY sal DESC LIMIT 1,1);
-- 3000


SELECT * FROM emp
WHERE sal = @sal2;
-- WHERE sal = 3000

+-------+-------+---------+------+------------+---------+------+--------+
| empno | ename | job     | mgr  | hire       | sal     | comm | deptno |
+-------+-------+---------+------+------------+---------+------+--------+
|  7788 | SCOTT | ANALYST | 7566 | 1982-12-09 | 3000.00 | NULL |     20 |
|  7902 | FORD  | ANALYST | 7566 | 1981-12-03 | 3000.00 | NULL |     20 |
+-------+-------+---------+------+------------+---------+------+--------+


-- using sub-query
SELECT * FROM emp
WHERE sal = (SELECT DISTINCT sal FROM emp ORDER BY sal DESC LIMIT 1,1);



--__________________________________________
-- Display the details of emp who earns 3rd highest sal.

SELECT * FROM emp
WHERE sal = (SELECT DISTINCT sal FROM emp ORDER BY sal DESC LIMIT 2,1);
+-------+-------+---------+------+------------+---------+------+--------+
| empno | ename | job     | mgr  | hire       | sal     | comm | deptno |
+-------+-------+---------+------+------------+---------+------+--------+
|  7566 | JONES | MANAGER | 7839 | 1981-04-02 | 2975.00 | NULL |     20 |
+-------+-------+---------+------+------------+---------+------+--------+
1 row in set (0.00 sec)





-- if the sub-query returns empty set :
-- SELECT * FROM emp WHERE sal = NULL;
-- empty set

--_______________________________________
-- Display all the employees who work in the same dept 
--as that of allen.

SELECT deptno FROM emp
WHERE ename = 'allen';
-- 30

SELECT * FROM emp
WHERE deptno = 30;
--______________________________________

-- OR using variable 
SET @dept_no = (SELECT deptno FROM emp WHERE ename = 'allen');

SELECT * FROM emp
WHERE deptno = @dept_no;
--_________________________________
-- OR using sub-query

SELECT * FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'allen');



--________________________________________

--Display the details of all the employees 
--who have the same job like blake 
--and who earn the salary greater than employee clark.

SET @job = (SELECT job FROM emp WHERE ename = 'blake');
SET @sal = (SELECT sal FROM emp WHERE ename = 'clark');

SELECT * FROM emp
WHERE job = @job
AND 
sal > @sal;

+-------+-------+---------+------+------------+---------+------+--------+
| empno | ename | job     | mgr  | hire       | sal     | comm | deptno |
+-------+-------+---------+------+------------+---------+------+--------+
|  7566 | JONES | MANAGER | 7839 | 1981-04-02 | 2975.00 | NULL |     20 |
|  7698 | BLAKE | MANAGER | 7839 | 1981-05-01 | 2850.00 | NULL |     30 |
+-------+-------+---------+------+------------+---------+------+--------+
2 rows in set (0.01 sec)


-- OR

SELECT * FROM emp
WHERE job = (SELECT job FROM emp WHERE ename = 'blake')
AND
sal > (SELECT sal FROM emp WHERE ename = 'clark');


--_____________________________________________________
--Display the details of employees whose salary is LESS THAN 
--the average salary of all the employees from the emp table.

SELECT * FROM emp
WHERE sal < (SELECT AVG(sal) FROM emp);


--************************************************************
--_________________________________________
-- Multi Row Subqueries :
-- Operators : ANY , ALL 

-- ANY :
-- Compares will all values from subquery and returns true if 
-- condition is TRUE for any of them.
-- Similar to LOGICAL OR
    -- =Any : Equivalent to IN
    
    
    -- <ANY : Less Than Maximum
    -- weight <any of the weights from the subquery
    -- weight <ANY (45,65,55,70);
    -- Weight < 45 OR weight < 65 OR weight <55 OR weight < 70
    -- Weight < max value(70)

    -- >ANY : Greater Than Minimum
    -- sal >ANY(3000,2500,1500,1200,1700)
    -- sal >ANY 1200

--____________________________________________________________
-- Display the details of departments from dept table who have emps
-- working into it.
-- op : =ANY

-- Display all departments :
SELECT * FROM dept;

+--------+------------+----------+
| deptno | dname      | loc      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.01 sec)

SELECT DISTINCT deptno FROM emp;
+--------+
| deptno |
+--------+
|     10 |
|     20 |
|     30 |
+--------+
3 rows in set (0.01 sec)

SELECT * FROM dept
WHERE deptno =ANY(SELECT DISTINCT deptno FROM emp);
 --            (10,20,30)

+--------+------------+----------+
| deptno | dname      | loc      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
+--------+------------+----------+
3 rows in set (0.01 sec)

-- OR

SELECT * FROM dept
WHERE deptno IN(SELECT DISTINCT deptno FROM emp);
--              (10,20,30)



/*
=ANY operator works like IN operator.
Both give the same result.
*/




--____________________________________________________
--	Display all the emps who earn salary less than 
--any of the emps in dept 20.

-- check sals of dept 20
SELECT DISTINCT sal FROM emp
WHERE deptno = 20;

+---------+
| sal     |
+---------+
|  800.00 |
| 2975.00 |
| 3000.00 |
| 1100.00 |
+---------+
4 rows in set (0.02 sec)

SELECT * FROM emp
WHERE sal <ANY (SELECT DISTINCT sal FROM emp WHERE deptno = 20);
--           <ANY  (800,2975,3000,1100)
--             < (3000)

 /*

 <ANY considers LESS THAN MAXIMUM value coming frm the sub-query.


The above multi row subquery can be written as the single row sub-query as below :
*/


SELECT * FROM emp
WHERE sal < (SELECT MAX(sal) FROM emp WHERE deptno = 20);



--________________________________________________________
--Display all the emps who earn salary more than 
--any of the salesman.

-- check the salaries of salesman.
SELECT DISTINCT sal FROM emp 
WHERE job = 'salesman';

+---------+
| sal     |
+---------+
| 1600.00 |
| 1500.00 |
| 1250.00 |
+---------+
3 rows in set (0.00 sec)


-- using multi-row sub-query
SELECT * FROM emp
WHERE sal >ANY (SELECT DISTINCT sal FROM emp WHERE job = 'salesman');
 --        >ANY  (1600,1500,1250)
--         > (1250)


-- >ANY considers greater than minimum value from all the values coming from
-- inner query.


-- using single row sub-query
SELECT * FROM emp
WHERE sal > (SELECT MIN(sal) FROM emp WHERE job = 'salesman');




--____________________________________________________
-- ALL operator :
---- Compares with all values from subquery and returns true if 
-- condition is TRUE for all of them.
-- Similar to LOGICAL AND
 
    -- < ALL : Less than Minimum
    -- weight < ALL 
    -- WEIGHT <ALL (45,65,75,80)
    -- WEIGHT < 45 AND weight < 65 AND weight < 75
    -- weight < 45(most minimum)

-- > ALL : Greater tha max
    -- WEIGHT >ALL (45,65,75,80)
   -- WEIGHT > 45 AND weight>65 AND weight > 75 
   -- weight > 80(maximum)
    
    -- = ALL : not possible
    
    -- <> ALL : equivalent to NOt IN

--________________________________________________________
--Display the details of emps who earn salary 
--more than all the salesman.

SELECT DISTINCT sal FROM emp
WHERE job = 'salesman';

+---------+
| sal     |
+---------+
| 1600.00 |
| 1500.00 |
| 1250.00 |
+---------+
3 rows in set (0.00 sec)
--using multi-row sub-query

SELECT * FROM emp
WHERE sal >ALL (SELECT DISTINCT sal FROM emp WHERE job = 'salesman');
--           >ALL(1600,1500,1250)
--            > (1600)



-- >ALL means GREATER THAN MAXIMUM value coming from the subquery.

-- using single row sub-query

SELECT * FROM emp
WHERE sal > (SELECT MAX(sal) FROM emp WHERE job = 'salesman');


--______________________________________________
--Display the details of emps who earn the salary 
--less than all the emps working in department 30.

SELECT DISTINCT sal 
FROM emp
WHERE deptno = 30;

+---------+
| sal     |
+---------+
| 1600.00 |
| 1250.00 |
| 2850.00 |
| 1500.00 |
|  950.00 |
+---------+
5 rows in set (0.00 sec)

-- using multi-row sub-query

SELECT * FROM emp
WHERE sal <ALL (SELECT DISTINCT sal FROM emp WHERE deptno = 30);
 --       <ALL (1600,1250,2850,1500,950)
 --       < (950)

-- <ALL means LESS THAN MINIMUM value coming from the sub-query 

-- using single-row sub-query
SELECT * FROM emp
WHERE sal < (SELECT MIN(sal) FROM emp WHERE deptno = 30);

--__________________________________________
-- 	Display the depts who do not have emps.

SELECT * FROM dept
WHERE deptno <>ALL (SELECT DISTINCT deptno FROM emp);
 --                (10,20,30)

+--------+------------+--------+
| deptno | dname      | loc    |
+--------+------------+--------+
|     40 | OPERATIONS | BOSTON |
+--------+------------+--------+
1 row in set (0.00 sec)

-- OR

SELECT * FROM dept
WHERE deptno NOT IN (SELECT DISTINCT deptno FROM emp);

/*
=ANY :  IN
<ANY :  LESS THAN MAX value
>ANY :  GREATER THAN MIN value
<ALL : LESS THAN MIN value
>ALL : GREATER THAN MAX value
=ALL : Not Possible
<>ALL : NOT IN

*/





--*******************************************************
--_______________________________________________
-- Co-related Subquery

/*
1) Each row from the outer query table is sent one by one to the inner query.
2) The inner query executes itself using the row sent from the outer query and then sends the output to the outer query.
3) The outer query then prints that row if the condition matches with the output sent from inner query.
*/



-- Display the details of emps with max sal in each dept.


-- deptwise max sal display :
SELECT deptno,MAX(sal)
FROM emp
GROUP BY deptno;

+--------+----------+
| deptno | MAX(sal) |
+--------+----------+
|     10 |  5000.00 |
|     20 |  3000.00 |
|     30 |  2850.00 |
+--------+----------+
3 rows in set (0.01 sec)

SELECT empno,ename,deptno,sal
FROM emp WHERE sal =ANY (SELECT MAX(sal) FROM emp GROUP BY deptno);
--                    (5000,3000,2850) 

SELECT .... FROM emp WHERE sal IN(5000,3000,2850);

/*
10    5000  A 
10    3000  B
10     2000  C
20    3000    D
20    2850   E
30    2850   F

*/


SELECT e1.empno,e1.ename,e1.deptno,e1.sal
FROM emp e1
WHERE e1.sal = (SELECT MAX(sal) FROM emp e2 WHERE e2.deptno = e1.deptno);


 -- 1st row sent : CLARK - 2450 - dept 10
 --      (SELECT MAX(sal) FROM emp e2 WHERE e2.deptno = 10)
 --     5000
  ---    clark from dept 10 does not earn the max sal in that dept, that row is not displayed 5000
  

  -- 2nd row of allen from dept 30 with sal 1600 is sent to inner query
  -- inner query will execute itself depending on that current row sent.
  -- SELECT MAX(sal) FROM emp WHERE deptno = 30
  -- 2850 
  -- as allens sal is 1600 it does not match the 2850 coming from inner query.
  -- hence not displayed.




-- Display the details of emps who are earning more than 
--the avg sal of their dept.

SELECT deptno,AVG(sal)
FROM emp
GROUP BY deptno;



SELECT empno,ename,deptno,sal
FROM emp e1
WHERE sal > (SELECT AVG(sal) FROM emp e2 WHERE e2.deptno = e1.deptno);




-- Display the departments from the depts table, which have emps working in it.

SELECT * FROM dept
WHERE deptno =ANY (SELECT DISTINCT deptno FROM emp);

-- OR

SELECT * FROM dept
WHERE deptno IN (SELECT DISTINCT deptno FROM emp);


SELECT * FROM dept
WHERE deptn0 IN (SELECT deptno FROM emp);



SELECT * FROM dept d 
WHERE deptno = (SELECT deptno FROM emp e WHERE e.deptno = d.deptno);

-- OR

SELECT * FROM dept d 
WHERE EXISTS (SELECT deptno FROM emp e WHERE e.deptno = d.deptno);

/*
The EXISTS operator is a boolean operator that returns either true or false. 
The EXISTS operator is often used to test for the existence of rows 
returned by the subquery.
In addition, the EXISTS operator terminates further processing immediately 
once it finds a matching row, 
which can help improve the performance of the query.
Note that you can use SELECT *, SELECT column, SELECT a_constant, 
or anything in the subquery. The results are the same 
because MySQL ignores the select list that appeared in the SELECT clause of the
sub-query.
*/



-- Display the details of emps who are managers.

SELECT empno,ename,job,sal
FROM emp m
WHERE EXISTS (SELECT 1 FROM emp e WHERE e.mgr = m.empno);


/*
The NOT operator negates the EXISTS operator. In other words, the NOT EXISTS 
returns true if the subquery returns no row, otherwise it returns false.
*/


-- Display the depts which do not have any emps.

SELECT * FROM dept d 
WHERE NOT EXISTS (SELECT * FROM emp e WHERE e.deptno = d.deptno);




SELECT * FROM emp e1 
WHERE NOT EXISTS (SELECT * FROM emp e2 WHERE e2.mgr = e1.empno);




--***************************************************
--___________________________________________
-- Sub-queries in DML
-- Delete emp earning max sal.

-- find the emp earning max sal.
SELECT * FROM emp
WHERE sal = MAX(sal);
-- Error : group function Not allowed in WHERE clause

SELECT * FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp);
-- 5000

DELETE FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp);
-- Error :
-- the SELECT and DML on the same table is NOT ALLOWED IN MySQL.

SET @max_sal = (SELECT MAX(sal) FROM emp);

DELETE FROM emp
WHERE sal = @max_sal;



--__________________________________________
--delete the dept which has no employee working in it.

-- check the depts from dept table.
-- 10 ,20,30,40


-- check which dept has emps working in it.
-- 10,20,30



-- delete the dept which has no emps.
DELETE FROM dept
WHERE deptno NOT IN (SELECT DISTINCT deptno FROM emp);
--                   (10,20,30)


DELETE FROM dept
WHERE deptno <>ALL(SELECT DISTINCT deptno FROM emp);
--                (10,20,30)


--___________________________________________
-- Insert JOHN in RESEARCH dept as ANALYST on sal 2800.
-- empno : 12345
-- ename : John
-- deptno : ?? RESEARCH
-- job : ANALYST
-- sal : 2800

SELECT deptno FROM dept
WHERE dname = 'RESEARCH';


INSERT INTO emp(empno,ename,deptno,job,sal)
values
(1234,'John',(SELECT deptno FROM dept WHERE dname = 'RESEARCH'),'ANALYST',2800);



--______________________________________________________
--INSERT SAM in a SALES dept as Salesman 
-- with sal same as highest sal of salesman
-- keep the empno as max(empno) + 1.

-- ename : SAM
-- deptno : ?? sales  --> dept 
-- job : salesman
-- sal : highest sal of salesman  --> emp
-- empno : max + 1 --> emp
SET @max_empno = ((SELECT MAX(empno)FROM emp)+1);
SET @max_sal = (SELECT MAX(sal) FROM emp WHERE job = 'SALESMAN');


INSERT INTO emp(empno,ename,deptno,job,sal)
VALUES 
(@max_empno,'SAM',(SELECT deptno FROM dept WHERE dname = 'SALES'),'SALESMAN',
@max_sal);



--*****************************************************
--____________________________________________
--Sub-query in Projection
-- Display the deptno, total number of emps in each dept with 
--total emps from the table 

-- display count of emps in each dept.
SELECT deptno,COUNT(empno)
FROM emp
GROUP BY deptno;

+--------+--------------+
| deptno | COUNT(empno) |
+--------+--------------+
|     10 |            3 |
|     20 |            5 |
|     30 |            6 |
+--------+--------------+
3 rows in set (0.00 sec)

-- display the count of emps of the entire table.
SELECT COUNT(empno) total_emps
FROM emp;

+------------+
| total_emps |
+------------+
|         14 |
+------------+
1 row in set (0.01 sec)


-- REquirement :

+--------+--------------+
| deptno | COUNT(empno) |  total_emps
+--------+--------------+   
|     10 |            3 |    14
|     20 |            5 |    14
|     30 |            6 |    14
+--------+--------------+


SELECT deptno,COUNT(empno) deptwise_count,
(SELECT COUNT(empno) total_emps FROM emp) total_emps
FROM emp
GROUP BY deptno;




--____________________________________________________
-- Sub-query in FROM clause
--Display empno along with the category as per sal 
--(if sal > 2500, above avg, else avg).

SELECT empno,IF(sal>2500,"Above Avg","Avg") AS category
FROM emp;

/*
-- Requirement

category    Count_of_category
------------------------------
Above_avg      5
Avg            9

*/

-- Display the count of emps in each category
SELECT category,COUNT(empno) Count_of_category
FROM (SELECT empno,if(sal>2500,"Above Avg","Avg") AS category
FROM emp)  AS emp_category_tb
GROUP BY category;


/*
SELECT category,COUNT(empno)
FROM emp_category_tb
GROUP BY category;


We can consider emp_category_tb as the temp table which has
2 columns empno and category column (which was given using the if condition)

*/

--_______________________________________________________________

--________________________VIEWS_______________________________
-- views : 

-- Create a simple view with empno,ename and mgr from emp table.

CREATE VIEW v1 AS 
(SELECT empno,ename,mgr
FROM emp);


SELECT * FROM v1;


+-------+--------+------+
| empno | ename  | mgr  |
+-------+--------+------+
|  7369 | SMITH  | 7902 |
|  7499 | ALLEN  | 7698 |
|  7521 | WARD   | 7698 |
|  7566 | JONES  | 7839 |
|  7654 | MARTIN | 7698 |
|  7698 | BLAKE  | 7839 |
|  7782 | CLARK  | 7839 |
|  7788 | SCOTT  | 7566 |
|  7844 | TURNER | 7698 |
|  7876 | ADAMS  | 7788 |
|  7900 | JAMES  | 7698 |
|  7902 | FORD   | 7566 |
|  7934 | MILLER | 7782 |
|  7839 | KING   | NULL |
+-------+--------+------+
14 rows in set (0.01 sec)

-- insert into that view.
INSERT INTO v1 VALUES(1234,'AAA',7839);

-- The row is inserted into the main emp table.


-- Grant privileges on the view to the intern.
GRANT SELECT ON classwork_db.v1 TO intern;


--___________________________________________________
-- complex view
-- create a view on dept wise total,avg,max,min sal of emp table.

CREATE VIEW dept_sal_details AS
(SELECT deptno,AVG(sal) avg ,MAX(sal) max,MIN(sal) min,SUM(sal) total
FROM emp
GROUP BY deptno);


-- desc the views and select from the views.

mysql> DESC dept_sal_details;
+--------+---------------+------+-----+---------+-------+
| Field  | Type          | Null | Key | Default | Extra |
+--------+---------------+------+-----+---------+-------+
| deptno | int           | YES  |     | NULL    |       |
| avg    | decimal(12,6) | YES  |     | NULL    |       |
| max    | decimal(8,2)  | YES  |     | NULL    |       |
| min    | decimal(8,2)  | YES  |     | NULL    |       |
| total  | decimal(30,2) | YES  |     | NULL    |       |
+--------+---------------+------+-----+---------+-------+

+--------+-------------+---------+---------+----------+
| deptno | avg         | max     | min     | total    |
+--------+-------------+---------+---------+----------+ |
|     10 | 2916.666667 | 5000.00 | 1300.00 |  8750.00 |
|     20 | 2175.000000 | 3000.00 |  800.00 | 10875.00 |
|     30 | 1566.666667 | 2850.00 |  950.00 |  9400.00 |
+--------+-------------+---------+---------+----------+
3 rows in set (0.00 sec)



-- Insert the row in the view :
 INSERT INTO dept_sal_details VALUES(40,123.4,2000,1000,100000);
 -- ERROR 1471 (HY000): 
 --The target table dept_sal_details of the INSERT is not insertable-into



-- create a view showing the 
--empno,ename,sal,job,deptno,dname,location

CREATE VIEW emp_dept AS
(SELECT e.empno,e.ename,e.sal,e.job,d.deptno,d.dname,d.loc
FROM emp e INNER JOIN dept d 
ON e.deptno = d.deptno);


-- Select and desc the above view
DESC emp_dept;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| empno  | int          | YES  |     | NULL    |       |
| ename  | varchar(40)  | YES  |     | NULL    |       |
| sal    | decimal(8,2) | YES  |     | NULL    |       |
| job    | varchar(40)  | YES  |     | NULL    |       |
| deptno | int          | YES  |     | NULL    |       |
| dname  | varchar(40)  | YES  |     | NULL    |       |
| loc    | varchar(40)  | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


SELECT * FROM emp_dept;

+-------+--------+---------+-----------+--------+------------+----------+
| empno | ename  | sal     | job       | deptno | dname      | loc      |
+-------+--------+---------+-----------+--------+------------+----------+
|  7782 | CLARK  | 2450.00 | MANAGER   |     10 | ACCOUNTING | NEW YORK |
|  7934 | MILLER | 1300.00 | CLERK     |     10 | ACCOUNTING | NEW YORK |
|  7839 | KING   | 5000.00 | PRESIDENT |     10 | ACCOUNTING | NEW YORK |
|  7369 | SMITH  |  800.00 | CLERK     |     20 | RESEARCH   | DALLAS   |
|  7566 | JONES  | 2975.00 | MANAGER   |     20 | RESEARCH   | DALLAS   |
|  7788 | SCOTT  | 3000.00 | ANALYST   |     20 | RESEARCH   | DALLAS   |
|  7876 | ADAMS  | 1100.00 | CLERK     |     20 | RESEARCH   | DALLAS   |
|  7902 | FORD   | 3000.00 | ANALYST   |     20 | RESEARCH   | DALLAS   |
|  7499 | ALLEN  | 1600.00 | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7521 | WARD   | 1250.00 | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7654 | MARTIN | 1250.00 | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7698 | BLAKE  | 2850.00 | MANAGER   |     30 | SALES      | CHICAGO  |
|  7844 | TURNER | 1500.00 | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7900 | JAMES  |  950.00 | CLERK     |     30 | SALES      | CHICAGO  |
+-------+--------+---------+-----------+--------+------------+----------+
14 rows in set (0.00 sec)


-- Try the Insert on the above view.
INSERT INTO emp_dept VALUES(123,'AAA',123456,'MANAGER',20,'RESEARCH','DALLAS');


/*
when there are joins, group functions, sub-queries etc on the View,
such type of view is called a complex view.
Performing DML operations on the complex view is not allowed.
*/

-- display the total salaries of emps based on the group of dname
-- using the above view.
SELECT deptno,SUM(sal)
FROM emp
GROUP BY deptno;


SELECT d.dname,SUM(e.sal)
FROM emp e INNER JOIN dept d 
ON e.deptno = d.deptno 
GROUP BY d.dname;


-- We can use the above created view to display dept name wise sum sal.
-- making the complex query simpler.
SELECT dname,SUM(Sal)
FROM emp_dept
GROUP BY dname;

+------------+----------+
| dname      | SUM(Sal) |
+------------+----------+
| ACCOUNTING |  8750.00 |
| RESEARCH   | 10875.00 |
| SALES      |  9400.00 |
+------------+----------+


-- filter the above data of view for sum of sal of dname > 10000.
SELECT dname,SUM(Sal)
FROM emp_dept
GROUP BY dname
HAVING SUM(sal) > 10000;

+----------+----------+
| dname    | SUM(Sal) |
+----------+----------+
| RESEARCH | 10875.00 |
+----------+----------+
1 row in set (0.01 sec)

-- delete from complex view
DELETE FROM emp_dept
WHERE dname = 'RESEARCH';
-- ERROR

-- create a view with emps having no comm
CREATE VIEW emp_no_comm AS
(SELECT * FROM emp
WHERE comm IS NULL);


-- insert the row into the above view and add the value in the comm.

INSERT INTO emp_no_comm(empno,ename,sal,comm)
VALUES
(1234,'AAAA',112233,500);


-- Row inserted in the main table.


--_______________________________________
-- with check option
CREATE VIEW v_emp_no_comm AS
(SELECT empno,ename,sal,comm
FROM emp
WHERE comm IS NULL) WITH CHECK OPTION;

INSERT INTO v_emp_no_comm(empno,ename,sal,comm)
VALUES
(1234,'AAAA',112233,500);

-- ERROR 1369 (HY000): CHECK OPTION failed 'classwork_db.v_emp_no_comm'

INSERT INTO v_emp_no_comm(empno,ename,sal,comm)
VALUES
(1234,'AAAA',112233,NULL);


-- ______________________________________
-- show all views with full tables.

SHOW FULL TABLES;

-- show the create table query
SHOW CREATE TABLE emp;


SHOW CREATE TABLE v1;

-- drop a view
DROP VIEW v1;



