/*
AGENDA :
	1. DQL :  
	    - DISTINCT
	    - LIMIT
	    - ORDER BY
	2. WHERE:
	    - Relational Operators
		 - Logical Operators
		 - NULL Operators
		 - IN,BETWEEN
			- LIKE Operators
	3. DML :
			-  UPDATE, DELETE
	4. DDL:
			- Truncate, DROP
		DELETE vs TRUNCATE vs DROP

	5. DCL :
		- GRANT
		- REVOKE
	6. TCL :
		- COMMIT
		- ROLLBACK
		- SAVEPOINT

*/
--_____________________________DISTINCT___________________________________

-- Display all the jobs from emp table.
SELECT job FROM emp;


-- Display unique jobs from emp table.
SELECT DISTINCT job FROM emp;

+-----------+
| job       |
+-----------+
| CLERK     |
| SALESMAN  |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
+-----------+
5 rows in set (0.01 sec)


-- Display all the deptnos from emp table.
SELECT deptno FROM emp;


-- Display unique deptnos from emp table.
SELECT DISTINCT deptno FROM emp;
+--------+
| deptno |
+--------+
|     20 |
|     30 |
|     10 |
+--------+
3 rows in set (0.00 sec)


-- Display deptnos and job from emp table.

SELECT deptno,job FROM emp;


-- Display deptnos and their unique jobs from the emp table.
SELECT DISTINCT deptno,job FROM emp;

+--------+-----------+
| deptno | job       |
+--------+-----------+
|     20 | CLERK     |
|     30 | SALESMAN  |
|     20 | MANAGER   |
|     30 | MANAGER   |
|     10 | MANAGER   |
|     20 | ANALYST   |
|     10 | PRESIDENT |
|     30 | CLERK     |
|     10 | CLERK     |
+--------+-----------+
9 rows in set (0.00 sec)

-- DISTINCT keyword is used only once in the beginning.
-- It Displays the unqiue combinations of the columns given after it.

-- ________________________________LIMIT_________________________________
-- Display all the emps
SELECT * FROM emp;

-- Display first 5 emps from emp table.
SELECT * FROM emp
LIMIT 5;

-- Display first 10 emps from emp table.
SELECT * FROM emp
LIMIT 10;

---- Display ename,sal and job of first 8 employees
SELECT ename,sal,job
FROM emp
LIMIT 8;


-- Display ename,sal and allowance(20% of sal) for first 6 employees
SELECT ename,sal,sal * 0.2 AS allowance
FROM emp
LIMIT 6;


-- Display 6 records of emp skipping the first 5 records.
SELECT empno,ename,sal
FROM emp
LIMIT 5,6;

-- It will skip the 5 rows and display next 6 rows.


-- _______________________________ORDER BY_____________________________________
/*
ORDER BY clause is used to display the data in the specific order of a column, 
in the ascending or descending order of the column data.
By default with the ORDER BY clause the data of that column is displayed in the ascending order.
Optionally we can also mention the ASC keyword to specify the ascending order.
To display the data in the descing order , we have to specify the DESC keyword after the column.
*/


-- Display ename and salary of all the employees 
--with the data in ascending order of the names.

SELECT ename,sal
FROM emp
ORDER BY ename;

-- OR


SELECT ename,sal
FROM emp
ORDER BY ename ASC;



-- Display the empno, ename and sal of all the emps 
--with salaries displayed in the descending order.
SELECT empno,ename,sal
FROM emp
ORDER BY sal DESC;




-- Display the empno,ename,deptno,job from emp with the deptno in ascending order
SELECT empno,ename,deptno,job 
FROM emp
ORDER BY deptno;


-- Display the emp details sorted in asc order as per the deptno and job together

SELECT empno,ename,deptno,job
FROM emp
ORDER BY deptno,job;


-- display emp details with deptno sorted in desc order 
--and job sorted in asc order
SELECT empno,ename,deptno,job
FROM emp
ORDER BY deptno DESC,job;

-- OR

SELECT empno,ename,deptno,job
FROM emp
ORDER BY deptno DESC,job ASC;



-- deptno and job both in descending
SELECT empno,ename,deptno,job
FROM emp
ORDER BY deptno DESC,job DESC;


-- Display only first 7 emps sorted in the ascending order of sal.
SELECT empno,ename,deptno,sal
FROM emp
ORDER BY sal 
LIMIT 7;

-- Display the details of emp with the highest salary.
SELECT empno,ename,sal
FROM emp
ORDER BY sal DESC
LIMIT 1;


-- Display the details of 4 emps earning the least salary.
SELECT empno,ename,sal
FROM emp
ORDER BY sal ASC
LIMIT 4;


-- Display the details of emp earning 2nd highest salary.
SELECT empno,ename,sal
FROM emp 
ORDER BY sal DESC
LIMIT 1,2;

-- Display the details of emps earning 3rd highest salary.
SELECT empno,ename,sal
FROM emp
ORDER BY sal DESC
LIMIT 2,1;
-- Does not give the desired output.
-- We can use sub-queries to get the correct output.


-- Display the ename, sal and allowance(30% of sal) of emp 
--sorted in the descending order of allowance

SELECT ename,sal,sal*0.3 AS allowance
FROM emp
ORDER BY sal*0.3 DESC;

-- OR

SELECT ename,sal,sal*0.3 AS allowance
FROM emp
ORDER BY allowance DESC;
-- Alias is allowed in the ORDER BY clause


SELECT ename,sal,sal*0.3 AS allowance, sal+allowance
FROM emp;
-- ERROR : alias is not allowed in SELECT clause


-- Display the data sorted in descending order of the 3rd column 
-- given in the SELECT.

SELECT empno,ename,sal,deptno
FROM emp
ORDER BY 3;


-- Display the details of 3rd emp recruited.
SELECT empno,ename,sal,hire
FROM emp
ORDER BY hire
LIMIT 2,1;


--________________________WHERE________________________________
/*
WHERE clause is used to specify the condition. All the rows satisfying the underlying
condition are displayed. This is called as Selection.
WHERE clause should be given after the FROM clause.
*/

-- Relational ops : <, <=, >, >=, =, (!=,<>)

-- Display the details of all emps working in dept 30.
SELECT empno,ename,sal,deptno
FROM emp
WHERE deptno = 30;


-- Display all the emps earning the salary less than 2500.

SELECT empno,ename,sal
FROM emp
WHERE sal < 2500
ORDER BY sal;


-- Display the empno, ename, sal and job of all the emps working as analyst
SELECT empno,ename,sal,job
FROM emp
WHERE job = 'analyst';


-- Display the details of all the emps working in dept 30 as salesman.
SELECT empno,ename,deptno,job
FROM emp
WHERE deptno = 30
AND
job = 'salesman';

-- Display the details of emps earning sal > 1200 and working as clerk.
SELECT empno,ename,sal,job
FROM emp
WHERE sal > 1200
AND
job = 'clerk';


-- Display all the emps not working in dept 30.
SELECT empno,ename,deptno
FROM emp
WHERE deptno != 30;

-- OR


SELECT empno,ename,deptno
FROM emp
WHERE deptno <> 30;

--_______________________________________________________________
-- working with NULL
-- Display all the emps who do not have any comm (comm col is NULL)


SELECT empno,ename,sal,comm
FROM emp
WHERE comm = NULL;
-- Empty Set

-- To check for the NULL in the columns, we do not use the
-- relational operator. As relational ops are used to compare with actual values.

-- To check for NULL, we have the special op IS NULL.

SELECT empno,ename,sal,comm
FROM emp
WHERE comm IS NULL;

-- Display all emps who earn the comm ( comm col is not NULL)
SELECT empno,ename,sal,comm
FROM emp
WHERE comm IS NOT NULL;

+-------+--------+---------+---------+
| empno | ename  | sal     | comm    |
+-------+--------+---------+---------+
|  7499 | ALLEN  | 1600.00 |  300.00 |
|  7521 | WARD   | 1250.00 |  500.00 |
|  7654 | MARTIN | 1250.00 | 1400.00 |
|  7844 | TURNER | 1500.00 |    0.00 |
+-------+--------+---------+---------+
4 rows in set (0.00 sec)


SELECT empno,ename,sal,comm
FROM emp
WHERE comm IS NOT NULL
AND
comm != 0.0;


+-------+--------+---------+---------+
| empno | ename  | sal     | comm    |
+-------+--------+---------+---------+
|  7499 | ALLEN  | 1600.00 |  300.00 |
|  7521 | WARD   | 1250.00 |  500.00 |
|  7654 | MARTIN | 1250.00 | 1400.00 |
+-------+--------+---------+---------+
3 rows in set (0.00 sec)



--_______________________Logial AND_________________________
-- used to combine multiple conditions also used to display data in ranges
-- Display the details of emps hired in the year 1981
SELECT empno,ename,hire
FROM emp
WHERE hire >= '1981-01-01' 
AND
hire <= '1981-12-31';



-- Display all the emps earning the sal between 2000 and 3000.
SELECT empno,ename,sal
FROM emp
WHERE sal >= 2000 
AND
sal <= 3000;


-- __________________Logical OR___________________
-- Display all the managers and analyst.
SELECT empno,ename,job
FROM emp
WHERE job = 'manager'
OR
job = 'analyst';



-- Display all the emps who are not managers or analyst

SELECT empno,ename,job
FROM emp
WHERE job != 'manager'
AND
job != 'analyst';



--_________________BETWEEN______________________
-- used to display data in ranges.
-- Range is inclusive for both the ends.

-- Display the emps hired in 1982
SELECT empno,ename,hire
FROM emp
WHERE hire >= '1982-01-01'
AND
hire <= '1982-12-31';

-- OR

SELECT empno,ename,hire
FROM emp
WHERE hire BETWEEN '1982-01-01' AND '1982-12-31';


--display the details of emps earning the salaries 
--between 1200 and 3000.
SELECT empno,ename,sal
FROM emp
WHERE sal BETWEEN 1200 AND 3000;


-- Display all emps having the enames starting 
--between 'C' and 'M'.
SELECT ename
FROM emp
ORDER BY ename;




-- Expected Output :

 CLARK  |
| FORD   |
| JAMES  |
| JONES  |
| KING   |
| MARTIN |
| MILLER |

SELECT empno,ename
FROM emp
WHERE ename BETWEEN 'C' AND 'M';

-- OR

SELECT empno,ename
FROM emp
WHERE ename BETWEEN 'C' AND 'N';

-- OR
SELECT empno,ename
FROM emp
WHERE ename BETWEEN 'C' AND 'MZ';


-- ________________________NOT BETWEEN_______________________
-- excludes the range
-- Display all the emps who are not earning the salaries 
--in the range of 1500 to 2500
SELECT empno,ename,sal
FROM emp
WHERE sal NOT BETWEEN 1500 AND 2500;



-- ____________________________IN____________________________
/*
IN operator is used when we are comparing multiple values for 1 column
using equality relational operator.
*/
--Display details of all managers and analyst
SELECT empno,ename,job
FROM emp
WHERE job = 'manager'
OR
job = 'analyst';

-- OR

SELECT empno,ename,job
FROM emp 
WHERE job IN('manager','analyst');



-- Display all the emps working in dept 20 and 30.
SELECT empno,ename,deptno
FROM emp
WHERE deptno = 20
OR
deptno = 30;

-- OR

SELECT empno,ename,deptno
FROM emp
WHERE deptno IN(20,30);


-- Display the details of james,king and martin

SELECT empno,ename,sal
FROM emp
WHERE ename IN('james','king','martin');



-- Display the details of employees earning sal > 2500 
--or job = manager

SELECT empno,ename,sal,job
FROM emp
WHERE sal > 2500
OR
job = 'manager';

-- Here as the checking is done on two different columns and
-- there is inequality condition checked, we CANNOT use IN op. 


--________________________NOT IN________________________
-- display all emps not working as clerk or salesman
SELECT empno,ename,job
FROM emp
WHERE job != 'clerk'
AND
job != 'salesman';

-- OR


SELECT empno,ename,job
FROM emp
WHERE job NOT IN('clerk','salesman');


-- __________________ combine IN and BETWEEN____________________
-- Display all the emps who are working as managers or analyst 
-- and earning the sal between 2500 and 3500

SELECT empno,ename,sal,job
FROM emp
WHERE job IN('manager','analyst')
AND
sal BETWEEN 2500 AND 3500;


--__________________________LIKE________________________________
/*
LIKE op is used when we are not aware of the exact data.
This op has 2 wile cards.
1)  _ (underscore) : this specifies any one char
2) % (percent) : this specifies 0 or more chars
*/

-- Display all the details of emps whose names start with M
SELECT empno,ename,sal
FROM emp
WHERE ename LIKE 'M%';



-- Display emps whose names contain A as the 2nd char.
SELECT empno,ename
FROM emp
WHERE ename LIKE '_a%';



-- Display the names which have only 4 chars..

SELECT empno,ename
FROM emp
WHERE ename LIKE '____';




-- Display the emps whose name end with S;
SELECT empno,ename
FROM emp
WHERE ename LIKE '%s';


-- Display the emps whose names contain 2 A's anywhere(beginning,end or in middle).

SELECT empno,ename
FROM emp
WHERE ename LIKE '%a%a%';

-- Display enames between C and M
SELECT empno,ename
FROM emp
WHERE ename BETWEEN 'C' AND 'M'
OR
ename LIKE 'M%';



--_____________________________________________________________
-- Display the emp with highest sal between 1000 and 2000
SELECT empno,ename,sal
FROM emp
WHERE sal BETWEEN 1000 AND 2000
ORDER BY sal DESC
LIMIT 1;


-- Display the 5th highest sal between 1000 and 2000
SELECT empno,ename,sal
FROM emp
WHERE sal BETWEEN 1000 AND 2000
ORDER BY sal DESC
LIMIT 4,1;



-- Display the details of clerk with min salary
SELECT empno,ename,job,sal
FROM emp
WHERE job = 'clerk'
ORDER BY sal
LIMIT 1;


-- Display the 2nd highest salary from the dept 20 and 30.
SELECT empno,ename,sal,deptno
FROM emp
WHERE deptno IN(20,30)
ORDER BY sal DESC
LIMIT 1,1;



--______________________DML-UPDATE__________________________________

/*
UPDATE is a Data Manipulation Language command used to
update the data from the table.

-- syntax :
UPDATE table_name SET col_name = new_value
WHERE condition;

*/

-- Update the books table, increase the price of all 
-- c Prog books by 50/-
UPDATE books SET price = price+50
WHERE subject = 'C Programming';

-- to check the changes done :
SELECT * FROM books;

-- Decrease the price of all the books by 5% whose name contain programming word into it.
UPDATE books SET price = price - price * 0.05
WHERE name LIKE '%programming%';

SELECT * FROM books;

-- update the salaries of all the clerks to + 20%
UPDATE emp SET sal = sal + sal *0.2
WHERE job = 'clerk'; 


--__________________________ DML - DELETE___________________________
/*
DELETE is a Data Manipulation Language command
used to delete specific rows from the table.
--SYNTAX :
DELETE FROM tablename
WHERE condition;

*/

-- delete the student Ram from the student table.
DELETE FROM students
WHERE name = 'harsh';


DELETE FROM temp;

--___________________TRUNCATE _________________________

/*
TRUNCATE is a Data Definition Language statement.
DDL statements cannot be undone.
TRUNCATE is used to delete all the table data.
TRUNCATE does not have a WHERE clause.
We cannot undo the changes done with truncate.
All the data is deleted leaving the table structure intact.
We can reuse the table struture to insert new data into it.
*/


-- DDL command, deletes all the rows from the table PERMANENTLY.
-- The Data CANNOT be UNDONE.
TRUNCATE TABLE new_students;


mysql> DESC new_students;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| roll_no | int         | YES  |     | NULL    |       |
| name    | varchar(20) | YES  |     | NULL    |       |
| marks   | float       | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)


-- The table structure is intact. Only data is deleted permanently.


--___________________DROP_______________________
-- DDL 
-- removes the entire table structure with the data.
-- IT is a DDL command.
-- We cannot undo it.
-- Drop the temp table.

mysql> DROP TABLE students;
Query OK, 0 rows affected (0.04 sec)

mysql> DESC students;
-- ERROR 1146 (42S02): Table 'classwork_db.students' doesn't exist


/*
Difference between DELETE DROP AND TRUNCATE :

DELETE : DML command
-> The rows deleted can be un-done.
-> The table structure is in-tact
-> We can use where clause

TRUNCATE : DDL command
-> All the rows are deleted permenantly. It cannot be un-done.
-> The table structure is in-tact.
-> We cannot use where clause.

DROP : DDL command
-> It removes all the rows with its structure permanently.
-> It cannot be un-done.
-> We cannot use where clause.
*/
.
--_________________DCL__________________________
--GRANT and REVOKE

--Login Through Root User


-- Create few users (mgr,teamlead,dev1,dev2)
-- syntax : CREATE USER username IDENTIFIED BY 'pwd';


CREATE USER mgr IDENTIFIED BY 'REPLACE_WITH_UNIQUE_PASSWORD';

CREATE USER teamlead IDENTIFIED BY 'REPLACE_WITH_UNIQUE_PASSWORD';

CREATE USER dev1 IDENTIFIED BY 'REPLACE_WITH_UNIQUE_PASSWORD';

CREATE USER dev2 IDENTIFIED BY 'REPLACE_WITH_UNIQUE_PASSWORD';


-- Grant ALL privileges on classwork_db to mgr 
--with further grant options.

GRANT ALL PRIVILEGES ON classwork_db.* TO mgr WITH GRANT OPTION;


-- WITH GRANT OPTION allows the mgr to further grant the rights
-- to his subordinates.



-- Exit from root user
exit;

-- Login through mgr user


--_____________________________________________________________________
-- check the privileges for mgr
SHOW GRANTS;

-- mgr will give all the privileges 
--on classwork_db to teamlead With further grant rights
GRANT ALL PRIVILEGES ON classwork_db.* TO teamlead WITH GRANT OPTION;


--______________________________________________________
-- login with teamlead with prompt
cmd > 

-- check the databases
SHOW DATABASES;

-- check the tables

-- check the permissions


-- As a teamlead grant select ,insert and update 
--to dev1 on emp tables
GRANT INSERT,UPDATE,SELECT ON classwork_db.emp TO dev1;

--As a teamlead grant select to dev1 on dept tables
GRANT SELECT ON classwork_db.dept TO dev1;

dev1>DELETE FROM dept;
-- ERROR 1142 (42000): DELETE command denied to user 'dev1'@'localhost' for table 'dept'

-- As a teamlead grant select to dev2 on emp table
GRANT SELECT ON classwork_db.emp TO dev2;


--  revoke only Update permissions from dev1 on emp table.

REVOKE UPDATE ON classwork_db.emp FROM dev1;

UPDATE emp SET sal = 1000000;

dev1>UPDATE emp SET sal = 1000000;
-- ERROR 1142 (42000): UPDATE command denied to user 'dev1'@'localhost' for table 'emp'

--___________________________________________________
-- Login through dev1 :
-- check the databases and tables

-- check the grants.

-- Try the update command on dept table.

-- Try to create a table.
-- ACCESS denied

--__________________________________________________

-- DROP the user dev1
DROP USER dev1;


-- All the rights of dev1 on the classwork_db 
-- for all the tables will be revoked automatically.

-- rights of dev2 remain intact. no changes to their rights


--__________________________________________________
-- TCL :Transaction Control Language
-- COMMIT, ROLLBACK, SAVEPOINT


-- login from sunbeam user under classwork_db.

-- Check the autocommit variable.
SELECT @@autocommit;

+--------------+
| @@autocommit |
+--------------+
|            1 |
+--------------+
1 row in set (0.01 sec)


 /*
In mysql the predefined variable autocommit is 1 by default.
It means all the DML operations are committed(made permanent in the database) automatically.
We cannot undo the DMLs if wrong.
 */


-- Create a new table accounts with 
--id int, acc_type char(10),balance Decimal(10,2)
CREATE TABLE accounts 
(acc_id INT,
acc_type CHAR(20),
balance DECIMAL(10,2)
);


-- insert few values
/*
    1 'savings' 20000
    2 'savings' 5000
    3 'savings' 1500
    4 'current' 4000
    5 'savings'  10000
*/

INSERT INTO accounts VALUES(1,'savings',20000);
INSERT INTO accounts VALUES(2,'savings',5000);
INSERT INTO accounts VALUES(3,'savings',1500);
INSERT INTO accounts VALUES(4,'current',4000);
INSERT INTO accounts VALUES(5,'savings',10000);


mysql> SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 20000.00 |
|      2 | savings  |  5000.00 |
|      3 | savings  |  1500.00 |
|      4 | current  |  4000.00 |
|      5 | savings  | 10000.00 |
+--------+----------+----------+
5 rows in set (0.00 sec)


-- start the transaction
/*
Once we START TRANSACTION, all the DMLs inside this transaction are temporary.
Means we can undo the changes if wrong.
After the DMLs are fired, check the changes. If correct, we can COMMIT
the changes.
Once we fire COMMIT, the transaction is said to be completed.
After that, If we want to execute another set of DMLs we need to 
START TRANSACTION again.

As the DMLS inside the TRANSACTION are temporary, these changes will not
be visible to other users accessing the same data.
Other users will be able to see the old data.
Once the changes are committed, new data is visible to them.
*/
START TRANSACTION;

-- update the accounts table and deduct 1000 from acc 1 and add 1000 to acc 2.
UPDATE accounts 
SET balance = balance - 5000
WHERE acc_id = 1;


UPDATE accounts SET balance = balance + 5000
WHERE acc_id = 2;

-- check the changes done.
SELECT * FROM accounts;

-- If the changes are correct, make the changes permanent.

COMMIT;

-- After we COMMIT the above DMLs, the transaction is said to be completed.
-- From here, all the DMLs are by default Permanent again.
-- We have to start another transaction for new set of DMLs.

-- start the transaction and perform some DMLs.
START TRANSACTION;


UPDATE accounts SET balance = balance - 2000
WHERE acc_id = 3;

DELETE FROM accounts WHERE acc_id = 4;

+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 15000.00 |
|      2 | savings  | 10000.00 |
|      3 | savings  |  -500.00 |
|      5 | savings  | 10000.00 |
+--------+----------+----------+
4 rows in set (0.00 sec)

-- Assuming the DMLs are wrong, undo the changes.

-- Undo the changes :
ROLLBACK;

-- check the changes undone :
mysql> SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 15000.00 |
|      2 | savings  | 10000.00 |
|      3 | savings  |  1500.00 |
|      4 | current  |  4000.00 |
|      5 | savings  | 10000.00 |
+--------+----------+----------+
5 rows in set (0.00 sec)


-- Rollback is a TCL command used to undo the DMLs fired in the current transaction;
-- The Transaction is said to be complete when we fire a COMMIT or ROLLBACK.


-- What happens if we do not START TRANSACTION :
-- update the accounts table but the updates are wrong


mysql> SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 15000.00 |
|      2 | savings  | 10000.00 |
|      3 | savings  |  1500.00 |
|      4 | current  |  4000.00 |
|      5 | savings  | 10000.00 |
+--------+----------+----------+
5 rows in set (0.00 sec)

mysql> DELETE FROM accounts WHERE acc_id = 4;
Query OK, 1 row affected (0.01 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 15000.00 |
|      2 | savings  | 10000.00 |
|      3 | savings  |  1500.00 |
|      5 | savings  | 10000.00 |
+--------+----------+----------+
4 rows in set (0.00 sec)



-- considering the changes to be wrong
-- discard the changes done.


-- the above update command is NOT UNDONE by rollback, as it was NOT inside
-- the transaction.
-- ALL the DMLs which are only fired inside the START TRANSACTION can be rolledback.
-- Otherwise the DMLs are permanent.

--___________________________________________________________
-- SAVEPOINT
-- Start the transaction, perform few DML operations. Apply SAvepoints after few DMLS.
START TRANSACTION;

INSERT INTO accounts VALUES(4,'current',5000);
INSERT INTO accounts VALUES(6,'current',7000);

SAVEPOINT s1;

UPDATE accounts SET balance = balance + 2000
WHERE acc_id = 1;
UPDATE accounts SET balance = balance - 2000
WHERE acc_id = 2;

SAVEPOINT s2;

DELETE FROM accounts WHERE acc_id = 3;
DELETE FROM accounts WHERE acc_id = 4;


mysql> SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 17000.00 |
|      2 | savings  |  8000.00 |
|      5 | savings  | 10000.00 |
|      6 | current  |  7000.00 |
+--------+----------+----------+
4 rows in set (0.00 sec)

mysql> ROLLBACK TO s2;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 17000.00 |
|      2 | savings  |  8000.00 |
|      3 | savings  |  1500.00 |
|      5 | savings  | 10000.00 |
|      4 | current  |  5000.00 |
|      6 | current  |  7000.00 |
+--------+----------+----------+
6 rows in set (0.00 sec)


-- The above INSERT and UPDATE are still temporary. We need to
-- explicitly commit them.

-- ROLLBACK TO savepoint DOES NOT complete the transaction.
-- TRANSACTION is said be complete only with COMMIT or ROLLBACK.

COMMIT;
--_______________________________________________________

-- Start the transaction, perform few DMLs and perform a DDL command after that.

START TRANSACTION;

DELETE FROM accounts
WHERE acc_id = 3;

+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 17000.00 |
|      2 | savings  |  8000.00 |
|      5 | savings  | 10000.00 |
|      4 | current  |  5000.00 |
|      6 | current  |  7000.00 |
+--------+----------+----------+
5 rows in set (0.00 sec)

DROP TABLE temp;

ROLLBACK;

mysql> SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 17000.00 |
|      2 | savings  |  8000.00 |
|      5 | savings  | 10000.00 |
|      4 | current  |  5000.00 |
|      6 | current  |  7000.00 |
+--------+----------+----------+
5 rows in set (0.00 sec)



-- DROP being a DDL command, it is autocommitted.
-- It also commits all the data/ DMLs fired before it.
-- In short , all the temporary data is committed when you fire a DDL command.

-- This rollback will not be able to undo the changes for the above DML.

-- When we fire a DDL inside the transaction, the transaction is completed
-- We have to start a new transaction to fire new DMLs.
--________________________________________________________________

-- to check the autocommit
SELECT @@autocommit;



-- Set autocommit to 0.
SET @@autocommit = 0;


mysql> SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 17000.00 |
|      2 | savings  |  8000.00 |
|      5 | savings  | 10000.00 |
|      4 | current  |  5000.00 |
|      6 | current  |  7000.00 |
+--------+----------+----------+
5 rows in set (0.00 sec)

mysql> DELETE FROM accounts WHERE acc_id = 1;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      2 | savings  |  8000.00 |
|      5 | savings  | 10000.00 |
|      4 | current  |  5000.00 |
|      6 | current  |  7000.00 |
+--------+----------+----------+
4 rows in set (0.00 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 17000.00 |
|      2 | savings  |  8000.00 |
|      5 | savings  | 10000.00 |
|      4 | current  |  5000.00 |
|      6 | current  |  7000.00 |
+--------+----------+----------+
5 rows in set (0.00 sec)


/*
As the autocommit variable is set to 0, all the DMLs are temporary.
We need to explicitly fire commit to make them permanent.
We do not need to START TRANSACTION.
In this each DML is a separate transaction.
We have to fire the commit or rollback to complete that transaction.
If we fire any DDL command after the DML, it internally commits all the 
temporary transactions, hence the ROLLBACK will not undo the changes of the DML
above the DDL.
*/

--__________________________________________________________________