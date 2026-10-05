/*
AGENDA :
	1. TCL continued :
					 -- Table Locking
				    -- Row locking
				    -- Pessimistic locking
	
	2. Single Row FUNCTIONS 
	
	            a) Numeric Functions
	            b) String Functions
				c) DateTime Functions
				d) Flow Control functions

    3. ALTER Table :
	4. REGEXP :


*/
--________________________________________________________________
/* Login with sunbeam user and mgr user.
Both the users have the access of classwork_db and accounts table.
under the sunbeam user, start the transaction and update the data from accounts
table.
The updated data is visible to sunbeam user as he has done the changes.
But , if the mgr user accesses the same accounts table, he will not be able to see the updated changes done by sunbeam user, as the DML is inside the TRANSACTION and hence it is temporary.
the updates need to be made permanent with COMMIT.
After sunbeam user fires COMMIT, the updated data is visible to mgr user.
*/
-- sunbeam user :


sunbeam>SELECT * FROM accounts;
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

sunbeam>START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

sunbeam>UPDATE accounts SET balance = balance - 1000
    -> WHERE acc_id = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

sunbeam>
sunbeam>UPDATE accounts SET balance = balance + 1000
    -> WHERE acc_id = 5;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

sunbeam>SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 17000.00 |
|      2 | savings  |  7000.00 |
|      5 | savings  | 11000.00 |
|      4 | current  |  5000.00 |
|      6 | current  |  7000.00 |
+--------+----------+----------+
5 rows in set (0.00 sec)

-- These changes are not visible to mgr user.
--___________________________________________________
-- Sunbeam user is working on the rows with acc_id 1 and 2 under the transaction:

START TRANSACTION;

UPDATE accounts SET balance = balance - 3000
WHERE acc_id = 1;


UPDATE accounts SET balance = balance + 3000
WHERE acc_id = 2;


--__________________________________________________

-- mgr user :
mgr>SELECT * FROM accounts;
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

mgr>SELECT * FROM accounts;
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

mgr>SELECT * FROM accounts;
+--------+----------+----------+
| acc_id | acc_type | balance  |
+--------+----------+----------+
|      1 | savings  | 17000.00 |
|      2 | savings  |  7000.00 |
|      5 | savings  | 11000.00 |
|      4 | current  |  5000.00 |
|      6 | current  |  7000.00 |
+--------+----------+----------+
5 rows in set (0.00 sec)
--_________________________________________________________

UPDATE accounts SET balance = balance - 1000
WHERE acc_id = 4;


UPDATE accounts SET balance = balance + 1000
WHERE acc_id = 6;



-- Table Locking
/*
In mysql , if the table does not have a primary key or index, 
there is a table lock.
Table lock means, when one user is executing any DML inside a transaction,
and the transaction is still ON,
Simultaneously if other user is executing another DML on some other row of the
same table, that transaction is locked for him. He cannot perform any DML
on the entire table.
That lock is released after a specific timeout or if the first user completes
the transaction by firing COMMIT or ROLLBACK.
*/


--______________ROW Locking_________________________
ALTER TABLE accounts ADD PRIMARY KEY(acc_id);

/*
As we have added the primary key, there is a row lock manintained across for DMLs
multiple users.
if sunbeam user starts the transaction and performs DML on id 1,
and the mgr user simultaneously performs DML on id 3,
Those DMLs will be successful in their respective logins as the DMLs are done 
on the different rows.
If the mgr user performs DML on id 1, and the transaction of sunbeam user
is still ON, that row will be locked for mgr user. The lock is released
either if the timeout is over of if the sunbeam user completes the transaction
by firing the commit or rollback.
So, in mysql by default there is a table lock.
We need the primary key or index on the table to achieve row locking.
*/

-- SUNBEAM user :
START TRANSACTION;

UPDATE accounts SET balance = balance - 3000
WHERE acc_id = 1;


UPDATE accounts SET balance = balance + 3000
WHERE acc_id = 2;



-- Mgr user :
UPDATE accounts SET balance = balance - 3000
    -> WHERE acc_id = 1;
--ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting transaction




--___________________Pessimistic Locking________________
/*
Optimistic locking : When the table or row is locked for other users
automatically when one user performs the DML, it is called optimistic locking.
Pessimistic locking : When the user explicitly locks particular rows
for other users to perform DML.
the explicit locking can be done with the command below.
SYNTAX : SELECT col1,col2 FROM tab WHERE condition FOR UPDATE.
All the rows satisfying the condition will be locked for DML.
The rows will be released after the user1 completes the transaction with commit 
or rollback.
*/
START TRANSACTION;

SELECT * FROM accounts
WHERE acc_id = 1 FOR UPDATE;


-- mgr
 UPDATE accounts SET balance = balance - 2000
 WHERE acc_id = 1;
 -- locked for mgr user


--*****************************************************************

--___________________Pre-Defined SQL FUNCTIONS___________________________________________

/*
Single Row Functions :
These type of functions operate on every row of the table
and return the output per row.

Multi Row Functions/ group functions :
These type of functions operate on the group of rows.
They return one output per group.
*/

-- syntax : SELECT column1,col2.. FROM table;

-- DUAL Table :
-- Dummy/Pseudo/Virtual table to complete the syntax of SELECT.
-- It contains one row and 1 column.

SELECT * FROM DUAL;
DESC DUAL;
-- The above SELECT and DESC will give error as the table is dummy.

-- Perform any arithmetic op with/without DUAL table;
SELECT 2345 * 45 / 12 + 17 FROM DUAL;


SELECT 2345 * 45 / 12 + 17;


-- display the current user , database and version with / without DUAL table.

SELECT DATABASE(),USER(),VERSION();

-- Display the current date and time using NOW() from DUAL table.
SELECT NOW() FROM DUAL;

-- CHECK the HELP for pre-defined functions.
HELP FUNCTIONS;

-- CHECK the HELP for NUMERIC Functions
HELP NUMERIC FUNCTIONS;


--_________________POW() / POWER()______________________

sunbeam>SELECT POW(7,3);
+----------+
| POW(7,3) |
+----------+
|      343 |
+----------+
1 row in set (0.01 sec)


-- ______________SQRT()__________________________

SELECT SQRT(49);

--________________ROUND()____________________________
SELECT ROUND(1234.567);

+-----------------+
| ROUND(1234.567) |
+-----------------+
|            1235 |
+-----------------+
1 row in set (0.01 sec)


SELECT ROUND(1234.567,2);
+-------------------+
| ROUND(1234.567,2) |
+-------------------+
|           1234.57 |
+-------------------+
1 row in set (0.00 sec)




SELECT ROUND(1234.567,-1);

+--------------------+
| ROUND(1234.567,-1) |
+--------------------+
|               1230 |
+--------------------+


SELECT ROUND(1267.34,-2);
+-------------------+
| ROUND(1267.34,-2) |
+-------------------+
|              1300 |
+-------------------+
1 row in set (0.00 sec)


SELECT ROUND(1234,-4);

+----------------+
| ROUND(1234,-4) |
+----------------+
|              0 |
+----------------+
1 row in set (0.00 sec)


/*
as we specified -1 in the 2nd parameter,
the range is 0 to 4 and 5 to 9
considering the ranges the changes are done to the tens place.
if the units place is in 0 to 4 range, the tens place will be
40
if the units place number is in 2nd range the tens number will be 50
*/




--Display the name and price of books rounded off to 
--2 digits after the point.
SELECT name,ROUND(price,2) FROM books;



--_________________TRUNCATE()___________________________

SELECT TRUNCATE(1234.67,1);

-- 1234.6

SELECT TRUNCATE(1237.67,-1);
+----------------------+
| TRUNCATE(1237.67,-1) |
+----------------------+
|                 1230 |
+----------------------+
1 row in set (0.00 sec)


--_________________CEIL() / CEILING()_______________________

-- Gives only int output.
-- gives the output as the next integer value.
SELECT CEIL(3.7);

+-----------+
| CEIL(3.7) |
+-----------+
|         4 |
+-----------+
1 row in set (0.01 sec)


SELECT CEIL(-2.6);

   -3   -2.6   -2   -1   0

+------------+
| CEIL(-2.6) |
+------------+
|         -2 |
+------------+


--___________________FLOOR()_____________________________
-- gives the nearest previous int value

SELECT FLOOR(6.8);

+------------+
| FLOOR(6.8) |
+------------+
|          6 |
+------------+
1 row in set (0.01 sec)


SELECT FLOOR (-5.6);
+--------------+
| FLOOR (-5.6) |
+--------------+
|           -6 |
+--------------+
1 row in set (0.00 sec)


--*******************************************************
--________________________String Functions____________________

--_____________LOWER()___________________________

SELECT LOWER('SUNbeam Info');

-- Display the enames from emp table in lower case.
SELECT empno,LOWER(ename) FROM emp;

--___________________UPPER()____________________


SELECT UPPER('sunbeam Info');


-- update the names from the books table to uppercase.
SELECT * FROM books;

UPDATE books SET name = UPPER(name);

SELECT * FROM books;

--__________________CONCAT()___________________________

--Display the empno, ename and job of the employee as 1 string
SELECT empno,ename,job FROM emp;

SELECT CONCAT(empno,' - ',ename, ' - ',job) AS emp_details
FROM emp;

-- display the string as
-- ename is working as job in deptno with salary
-- ename,job,deptno,sal
-- eg : King is working as president in deptno 10 with salary 5000

SELECT CONCAT(ename,' is working as ',job,' in deptno ',deptno,' with salary as ',sal)
AS emp_details
FROM emp;



-- Display the sal , comm and the combination of sal-comm from emp

SELECT sal,comm,CONCAT(sal,' - ',comm) as sal_details
FROM emp;

/*
Single row functions return NULL as the output for the rows,
if any of the parameters has NULL.
*/

--____________________TRIM()______________________
-- TRIM()
-- Used to remove leading or trailing spaces in the string.
SELECT TRIM('  Sunbeam  Info     ') as result;

--LTRIM()
SELECT LTRIM('  Sunbeam Info    ') AS result;

+------------------+
| result           |
+------------------+
| Sunbeam Info     |
+------------------+

--RTRIM()
SELECT RTRIM('  Sunbeam Info    ') AS result;

+----------------+
| result         |
+----------------+
|   Sunbeam Info |
+----------------+
1 row in set (0.00 sec)


--__________________LPAD()_______________________
--syntax : LPAD('string',length,'char');


SELECT LPAD('Sunbeam',10,'*') As result;
+------------+
| result     |
+------------+
| ***Sunbeam |
+------------+



--___________________RPAD()________________________

SELECT RPAD('Sunbeam',10,'#') As result;

+------------+
| result     |
+------------+
| Sunbeam### |
+------------+
1 row in set (0.00 sec)


-- Nested function. padding on both sides.
-- display : **********sunbeam**********
--            
SELECT LPAD('sunbeam',17,'*') AS result;

**********sunbeam

SELECT  RPAD(LPAD('sunbeam',17,'*'),27,'*') AS result;
+-----------------------------+
| result                      |
+-----------------------------+
| **********sunbeam********** |
+-----------------------------+
1 row in set (0.00 sec)

--___________________SUBSTRING()___________________

-- HELP SUBSTRING;

SELECT SUBSTRING('Sunbeam',4) AS result;
-- from the 4th char fetch the string till the end.
-- beam


SELECT SUBSTRING('Sunbeam' FROM 4) As result;
-- beam

SELECT SUBSTRING('Sunbeam',4,3) AS result;
-- FRom the 4th char, fetch next 3 chars
-- bea

SELECT SUBSTRING('Sunbeam' FROM 4 FOR 3) as result;
-- bea

SELECT SUBSTRING('Sunbeam',-4) AS result;
-- beam

-- starts from the end of the string and 
--gives the substring from the last 4th char till the end.



-- Display all emps whose names start with 'M'
SELECT empno,ename FROM emp
WHERE ename LIKE 'M%';

SELECT empno,ename FROM emp
WHERE SUBSTRING(ename,1,1) = 'M';



-- Display all emps whose ename starts between 'C' and 'M'
SELECT empno,ename
FROM emp
WHERE SUBSTRING(ename,1,1) BETWEEN 'C' AND 'M';



--____________________LENGTH_________________________
-- gives the total length of output string
SELECT LENGTH('Sunbeam Info') AS result;

+--------+
| result |
+--------+
|     12 |
+--------+
1 row in set (0.00 sec)


--________________________LEFT()__RIGHT()___________________

SELECT SUBSTRING('sunbeam',4) AS result;
-- beam

SELECT LEFT('Sunbeam',3) AS result;
-- sun


SELECT RIGHT('Sunbeam',4) AS result;



-- Display all emps between ‘C’ and ‘M’
-- Lab work


-- Display the mobile number in the format
--INPUT :  7057590799
--OUTPUT : 70******99

SELECT CONCAT(LEFT('7057590799',2),'******',RIGHT('7057590799',2)) AS result;
+------------+
| result     |
+------------+
| 70******99 |
+------------+
1 row in set (0.01 sec)

SELECT RPAD(RPAD('70',8,'*'),10,'99') As result;

+------------+
| result     |
+------------+
| 70******99 |
+------------+

--______________________________________________________________
-- ASCII()

SELECT ASCII('A');



--*************************************************************

--_________________DATETIME FUNCTIONS_______________________
-- NOW()
SELECT NOW() as result FROM dual;

-- SYSDATE()
SELECT SYSDATE() as result;



-- Difference between NOW() and SYSDATE()

SELECT NOW(),SLEEP(5),NOW();

+---------------------+----------+---------------------+
| NOW()               | SLEEP(5) | NOW()               |
+---------------------+----------+---------------------+
| 2026-09-09 10:09:17 |        0 | 2026-09-09 10:09:17 |
+---------------------+----------+---------------------+
1 row in set (5.02 sec)

SELECT SYSDATE(),SLEEP(5),SYSDATE();

+---------------------+----------+---------------------+
| SYSDATE()           | SLEEP(5) | SYSDATE()           |
+---------------------+----------+---------------------+
| 2026-09-09 10:39:21 |        0 | 2026-09-09 10:39:26 |
+---------------------+----------+---------------------+
1 row in set (5.01 sec)

/*
NOW() returns the current date and time at which the query 
begins execution.
SYSDATE() returns the current date and time at which the function
actually executes.
*/

--DATE()
SELECT NOW(),DATE(NOW());


+---------------------+-------------+
| NOW()               | DATE(NOW()) |
+---------------------+-------------+
| 2026-09-09 10:40:03 | 2026-09-09  |
+---------------------+-------------+


-- TIME()
SELECT NOW(),TIME(NOW());


---------------------+-------------+
| NOW()               | TIME(NOW()) |
+---------------------+-------------+
| 2026-09-09 10:40:24 | 10:40:24    |
+---------------------+-------------+
1 row in set (0.00 sec)


--ADDDATE() / DATE_ADD()
-- Add 2 days to NOW()

SELECT NOW(),DATE_ADD(NOW(),INTERVAL 2 DAY);

+---------------------+--------------------------------+
| NOW()               | DATE_ADD(NOW(),INTERVAL 2 DAY) |
+---------------------+--------------------------------+
| 2026-09-09 10:41:50 | 2026-09-11 10:41:50            |
+---------------------+--------------------------------+
1 row in set (0.01 sec)



-- Add 1 day to the date '2000-05-01'
SELECT DATE_ADD('2000-05-01', INTERVAL 1 DAY) AS new_date;

SELECT DATE_ADD('2000-05-01', INTERVAL 1 YEAR)AS new_date;



-- Add 1 second to the date '2023-12-31 23:59:59'

SELECT DATE_ADD('2023-12-31 23:59:59', INTERVAL 1 SECOND )AS new_date;

+---------------------+
| new_date            |
+---------------------+
| 2024-01-01 00:00:00 |
+---------------------+
1 row in set (0.00 sec)


-- Add 1 min 1 second to the date 2100-12-31 23:59:59

SELECT DATE_ADD('2026-07-9 10:46:02',INTERVAL '01:01' MINUTE_SECOND) AS new_time;

-- Add -1 day and 5 hours to '1980-07-21 12:23:12' 

SELECT DATE_ADD('1980-07-21 12:23:12', INTERVAL '-1 5' DAY_HOUR) as new_date;
+---------------------+
| new_date            |
+---------------------+
| 1980-07-20 07:23:12 |
+---------------------+
1 row in set (0.00 sec)


--_______________________________________________________
-- DATE_SUB()/SUBDATE()

--subtract 31 days from the date 1987-08-17

SELECT DATE_SUB('1987-08-17',INTERVAL 31 DAY);


-- subtract 1 year from 2018-05-01
SELECT DATE_SUB('2018-05-01',INTERVAL 1 YEAR);



--_______________________________________________________
--  DATEDIFF() : difference in number of days :
-- TIMESTAMPDIFF() 
--display the difference in number of months between the dates
  --  '2009-1-12'   and   '2010-12-15'
SELECT TIMESTAMPDIFF(MONTH,'2009-1-12','2010-12-15') as diff;
+------+
| diff |
+------+
|   23 |
+------+

SELECT TIMESTAMPDIFF(YEAR,'2009-1-12','2010-12-15') as diff;

+------+
| diff |
+------+
|    1 |
+------+



-- display the difference in number of months between your birthdate and today

SELECT TIMESTAMPDIFF(MONTH,'1987-08-17',NOW()) AS diff;


-- display the diff in number of days between your birthdate and today.

SELECT TIMESTAMPDIFF(DAY,'1987-08-17',NOW()) AS diff;

-- display the ename and experience of emps in years.
SELECT ename, TIMESTAMPDIFF(YEAR,hire,NOW()) AS exp_in_yrs FROM emp;

-- Display the name and experience of emps in months
SELECT ename, TIMESTAMPDIFF(MONTH,hire,NOW()) AS exp_in_yrs FROM emp;



-- Display the ename and exp in years and months.
-- eg : 44 years and 7 months
SELECT ename, CONCAT(TIMESTAMPDIFF(YEAR,hire,NOW()),' years and ',
TIMESTAMPDIFF(MONTH,hire,NOW())%12) AS exp
FROM emp;


-- display todays date, time , day, month, year, week day.

SELECT DATE(NOW()),TIME(NOW()),DAY(NOW()),MONTH(NOW()),YEAR(NOW()),WEEKDAY(NOW());

SELECT MONTHNAME(NOW());

-- Display all the employees hired in 1982

SELECT empno,ename,hire
FROM emp
WHERE hire >= '1982-01-01'
AND 
hire <= '1982-12-31';



SELECT empno,ename,hire
FROM emp
WHERE hire BETWEEN '1982-01-01' AND '1982-12-31';


SELECT empno,ename,hire
FROM emp
WHERE YEAR(hire) = 1982;



--_____________________DATE_FORMAT______________________________
/*
%W → Full weekday name → Sunday
%w → Day of week (0=Sunday) → 6 (Saturday)
%M → Full month name → October
%m → Month number → 10
%Y → 4-digit year → 2009
%y → 2-digit year → 00
%H → Hour (00-23)
%I → 12-hour (01–12) → 10
%i → Minutes
%s → Seconds
%D → Day with suffix → 4th
%a → Abbreviated weekday → Thu
%d → Day (2 digits) → 04
%b → Abbreviated month → Oct
%j → Day of year → 277
*/

-- Display the hire date of employees as
-- eg : January 5th 1982, Monday

SELECT empno,ename,DATE_FORMAT(hire,'%M %D %Y, %W') AS hire_date
FROM emp;



--************************************************************************
--__________________FLOW CONTROL FUNCTIONS_______________
-- IFNULL()
-- syntax : IFNULL(exp,value)
-- if the exp/col is NULL, replace is with the 2nd parameter value

-- Display empno,sal,comm and total income of emps (sal + comm)

SELECT empno,sal,comm,CONCAT(sal,'-',comm) as total
FROM emp;


+-------+---------+---------+-----------------+
| empno | sal     | comm    | total           |
+-------+---------+---------+-----------------+
|  7369 |  800.00 |    NULL | NULL            |
|  7499 | 1600.00 |  300.00 | 1600.00-300.00  |
|  7521 | 1250.00 |  500.00 | 1250.00-500.00  |
|  7566 | 2975.00 |    NULL | NULL            |
|  7654 | 1250.00 | 1400.00 | 1250.00-1400.00 |
|  7698 | 2850.00 |    NULL | NULL            |
|  7782 | 2450.00 |    NULL | NULL            |
|  7788 | 3000.00 |    NULL | NULL            |
|  7839 | 5000.00 |    NULL | NULL            |
|  7844 | 1500.00 |    0.00 | 1500.00-0.00    |
|  7876 | 1100.00 |    NULL | NULL            |
|  7900 |  950.00 |    NULL | NULL            |
|  7902 | 3000.00 |    NULL | NULL            |
|  7934 | 1300.00 |    NULL | NULL            |
+-------+---------+---------+-----------------+
14 rows in set (0.00 sec)



SELECT empno,sal,comm,CONCAT(sal,'-',IFNULL(comm,0.0)) as total
FROM emp;

+-------+---------+---------+-----------------+
| empno | sal     | comm    | total           |
+-------+---------+---------+-----------------+
|  7369 |  800.00 |    NULL | 800.00-0.00     |
|  7499 | 1600.00 |  300.00 | 1600.00-300.00  |
|  7521 | 1250.00 |  500.00 | 1250.00-500.00  |
|  7566 | 2975.00 |    NULL | 2975.00-0.00    |
|  7654 | 1250.00 | 1400.00 | 1250.00-1400.00 |
|  7698 | 2850.00 |    NULL | 2850.00-0.00    |
|  7782 | 2450.00 |    NULL | 2450.00-0.00    |
|  7788 | 3000.00 |    NULL | 3000.00-0.00    |
|  7839 | 5000.00 |    NULL | 5000.00-0.00    |
|  7844 | 1500.00 |    0.00 | 1500.00-0.00    |
|  7876 | 1100.00 |    NULL | 1100.00-0.00    |
|  7900 |  950.00 |    NULL | 950.00-0.00     |
|  7902 | 3000.00 |    NULL | 3000.00-0.00    |
|  7934 | 1300.00 |    NULL | 1300.00-0.00    |
+-------+---------+---------+-----------------+
14 rows in set (0.00 sec)



--______________________________________________________
-- NULLIF()
-- syntax : NULLIF(exp,value)
-- compares 2 parameter values , returns null if both are equal.
-- returns 1st parameter if not equal.
-- sales / orders
-- sales /0  -- division by 0 problem
-- sales / NULLIF(orders,0)


NULLIF(new_contact_no,contact_no)
-- if both the column values are same, the function will return NULL.
-- if both the column values are not matching, 
-- this function returns the first parameter.


-- Display empname,sal and NULL for all the emps who earn the sal as 3000

SELECT ename,sal,NULLIF(sal,3000) FROM emp;

--_______________________________________________________
-- ISNULL() : similar to IS NULL
-- returns 0 or 1
-- 1 if the value is NULL
-- 0 if the value is NOt NULL


-- Display all the emps having comm as NULL.
SELECT empno,ename,sal,comm
FROM emp
WHERE comm IS NULL;
-- IS NULL is an operator used only in WHERE clause.



SELECT empno,ename,sal,comm,ISNULL(comm)
FROM emp;




-- display all the emps who do have a comm.
SELECT empno,ename,sal,comm
FROM emp
WHERE ISNULL(comm) = 1;

-- Emps who have the comm

SELECT empno,ename,sal,comm
FROM emp
WHERE ISNULL(comm) = 0;

SELECT empno,ename,sal,comm
FROM emp
WHERE comm IS NOT NULL;

-- IF function
-- condition ? exp1 (true): exp2(false)

--syntax : IF(condition,exp1(if true),exp2(if false))


-- Display empno,ename,sal and category of emp as per the sal.
--If sal >= 2500 the print "above avg" else print "avg".

SELECT empno,ename,sal,IF(sal>=2500, "Above Avg","Avg") AS category
FROM emp;


--_______________________________________________________________

-- List Functions (We can give any number of parameters):
-- CONCAT(),GREATEST(),LEAST(),coalesce()


-- GREATEST() : Returns the greatest value from the list of parmaters

-- Display the empno,sal,comm and the highest value among the sal or comm for the emps.
SELECT empno,ename,sal,comm,GREATEST(sal,IFNULL(comm,0.0)) "max_val"
FROM emp;


-- LEAST() : Returns the Least value from the list of parmaters
SELECT empno,ename,sal,comm,LEAST(sal,IFNULL(comm,0.0)) "min_val"
FROM emp;


-- coalesce() : Returns the first NON NULL Value.



/*
home_number
office_number
mobile_number
Landline_number
*/


SELECT empno,ename,
COALESCE(home_number,office_number,mobile_number,Landline_number) as contact_no
FROM emp;

/*
Please Note, we do not have the above columns in our table.
The above SELECT query is just for the reference example. 
*/
--_________________________________________________________
--__________________________-- ALTER :___________________
-- ALTER is a DDL command used to change the table structure.

-- create a table emp_backup as a clone of emp.
CREATE TABLE emp_backup SELECT * FROM emp;

DESC emp_backup;
SELECT * FROM emp_backup;


-- alter the above emp_backup table and add a column ph_number to it.

ALTER TABLE emp_backup ADD COLUMN ph_number VARCHAR(15);

+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| empno     | int          | YES  |     | NULL    |       |
| ename     | varchar(40)  | YES  |     | NULL    |       |
| job       | varchar(40)  | YES  |     | NULL    |       |
| mgr       | int          | YES  |     | NULL    |       |
| hire      | date         | YES  |     | NULL    |       |
| sal       | decimal(8,2) | YES  |     | NULL    |       |
| comm      | decimal(8,2) | YES  |     | NULL    |       |
| deptno    | int          | YES  |     | NULL    |       |
| ph_number | varchar(15)  | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

-- By default the column is added to the end of the table.




-- We can specify where we need to add the new column Last_name.
ALTER TABLE emp_backup ADD COLUMN last_name VARCHAR(20) AFTER ename;

+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| empno     | int          | YES  |     | NULL    |       |
| ename     | varchar(40)  | YES  |     | NULL    |       |
| last_name | varchar(20)  | YES  |     | NULL    |       |
| job       | varchar(40)  | YES  |     | NULL    |       |
| mgr       | int          | YES  |     | NULL    |       |
| hire      | date         | YES  |     | NULL    |       |
| sal       | decimal(8,2) | YES  |     | NULL    |       |
| comm      | decimal(8,2) | YES  |     | NULL    |       |
| deptno    | int          | YES  |     | NULL    |       |
| ph_number | varchar(15)  | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)

-- Alter the emp_backup table to modify the column ename to varchar(30) 
ALTER TABLE emp_backup MODIFY COLUMN ename VARCHAR(30);


+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| empno     | int          | YES  |     | NULL    |       |
| ename     | varchar(30)  | YES  |     | NULL    |       |
| last_name | varchar(20)  | YES  |     | NULL    |       |
| job       | varchar(40)  | YES  |     | NULL    |       |
| mgr       | int          | YES  |     | NULL    |       |
| hire      | date         | YES  |     | NULL    |       |
| sal       | decimal(8,2) | YES  |     | NULL    |       |
| comm      | decimal(8,2) | YES  |     | NULL    |       |
| deptno    | int          | YES  |     | NULL    |       |
| ph_number | varchar(15)  | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)

-- alter table to modify the column job to char(3)

ALTER TABLE emp_backup MODIFY COLUMN job CHAR(3);
-- ERROR 1406 (22001): Data too long for column 'job' at row 1


ALTER TABLE emp_backup MODIFY COLUMN job CHAR(10);

sunbeam>DESC emp_backup;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| empno     | int          | YES  |     | NULL    |       |
| ename     | varchar(30)  | YES  |     | NULL    |       |
| last_name | varchar(20)  | YES  |     | NULL    |       |
| job       | char(10)     | YES  |     | NULL    |       |
| mgr       | int          | YES  |     | NULL    |       |
| hire      | date         | YES  |     | NULL    |       |
| sal       | decimal(8,2) | YES  |     | NULL    |       |
| comm      | decimal(8,2) | YES  |     | NULL    |       |
| deptno    | int          | YES  |     | NULL    |       |
| ph_number | varchar(15)  | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)

-- drop the column
ALTER TABLE emp_backup DROP COLUMN ph_number;


-- rename the column
-- rename ename to first name
ALTER TABLE emp_backup RENAME COLUMN ename TO first_name;

sunbeam>DESC emp_backup;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| empno      | int          | YES  |     | NULL    |       |
| first_name | varchar(30)  | YES  |     | NULL    |       |
| last_name  | varchar(20)  | YES  |     | NULL    |       |
| job        | char(10)     | YES  |     | NULL    |       |
| mgr        | int          | YES  |     | NULL    |       |
| hire       | date         | YES  |     | NULL    |       |
| sal        | decimal(8,2) | YES  |     | NULL    |       |
| comm       | decimal(8,2) | YES  |     | NULL    |       |
| deptno     | int          | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
9 rows in set (0.00 sec)


-- rename the table
ALTER TABLE emp_backup RENAME TO new_emp; 

sunbeam>DESC emp_backup;
-- ERROR 1146 (42S02): Table 'classwork_db.emp_backup' doesn't exist
--OR

RENAME TABLE new_emp TO emp_backup;

--_____________________________________________________

--____________________REGEXP___________________________

-- REGEXP : stands for Regular Expressions.
-- Used in the WHERE clause to filter the records.
-- Similar to LIKE, used for pattern based filtering (Only for String)

/* USed in many places like 
        Databases :RDBMS, NoSQL 
        Web Programming(html,PHP)  
        Prog languages(java, python) Have built in regexp support 
*/

-- eg: used for email pattern checking, phone number etc.
-- REGEXP allows searching different patterns based on wildcard chars :
-- wildcards : $ ^ . * + [] [^] {} etc
-- every pattern has its own purpose.
-- $  : End of line 
-- ^  : Beginning of line 
-- .  : Any one char
-- [a-z] : denotes the range between a to z
--[a-z0-9] : denotes the range between a to z and 0 to 9
--[^a-z]: excludes the range a to z
--[aiu] : denotes any value  either a, i or u 
--etc



-- using like operator
-- Display all employees whose names start with 'A'

SELECT * FROM emp WHERE ename LIKE 'A%';
--_______________________________________________________________
-- CREATE TABLE (JUNK) with 1 column(col1) - VARCHAR(20)
CREATE TABLE junk(col1 VARCHAR(20));

-- Insert the values in different rows as follows : 
-- this , Biscuit, isnt, tasty, but, that, Cake, is, TOO GOOD.

INSERT INTO JUNK VALUES
('This'),
('Biscuit'),
('isnt'),
('Tasty'),
('but'),
('that'),
('Cake'),
('is'),
('Too'),
('good');

-- Display the table data.

sunbeam>SELECT * FROM junk;
+---------+
| col1    |
+---------+
| This    |
| Biscuit |
| isnt    |
| Tasty   |
| but     |
| that    |
| Cake    |
| is      |
| Too     |
| good    |
+---------+
10 rows in set (0.00 sec)




-- Display the values from the table containing "is" anywhere.
SELECT * FROM junk WHERE col1 REGEXP 'is';

+---------+
| col1    |
+---------+
| This    |
| Biscuit |
| isnt    |
| is      |
+---------+



-- Display the values from the table starting with "is".
SELECT * FROM junk 
WHERE col1 REGEXP '^is';
-- ^ denotes beginning

+------+
| col1 |
+------+
| isnt |
| is   |
+------+
2 rows in set (0.00 sec)


-- Display all values from the table ending with "is".
SELECT * FROM junk
WHERE col1 REGEXP 'is$';
-- $ denotes end with 'is'

+------+
| col1 |
+------+
| This |
| is   |
+------+
2 rows in set (0.00 sec)


-- Display all values from the table having only 'is'.
SELECT * FROM junk
WHERE col1 REGEXP '^is$';

+------+
| col1 |
+------+
| is   |
+------+
1 row in set (0.00 sec)



--____________________________________________________
-- Selections :
-- create a new table as dummy with 1 column(col1) - varchar(20)
CREATE TABLE dummy (col1 VARCHAR(20));

-- insert the below values :
-- bag, beg, big, bog, bug, b*g, bg, xyz
INSERT INTO dummy VALUES
('bag'),
('beg'),
('big'),
('bog'),
('bug'),
('b*g'),
('bg'),
('xyz');

-- Display the data.

sunbeam>SELECT * FROM dummy;
+------+
| col1 |
+------+
| bag  |
| beg  |
| big  |
| bog  |
| bug  |
| b*g  |
| bg   |
| xyz  |
+------+
8 rows in set (0.00 sec)


-- Display the values from the table having any 1 char between 'b' and 'g'
SELECT * FROM dummy
WHERE col1 REGEXP 'b.g';
-- . denotes any one char in between

+------+
| col1 |
+------+
| bag  |
| beg  |
| big  |
| bog  |
| bug  |
| b*g  |
+------+
6 rows in set (0.00 sec)


-- Display all the values that have only one alphabet in between 'b' and 'g'.
SELECT * FROM dummy
WHERE col1 REGEXP 'b[a-z]g';
-- [a-z] denotes any one alhpabet in the range of small a to z
-- [A-Za-z] denotes any alphabet in the range of capital and small
-- [a-z0-9] range of small alphabets and numbers


+------+
| col1 |
+------+
| bag  |
| beg  |
| big  |
| bog  |
| bug  |
+------+
5 rows in set (0.00 sec)


-- Display all the values having 1 alphabets between b and g 
--out of the chars a,i,u

SELECT * FROM dummy
WHERE col1 REGEXP 'b[aiu]g';

+------+
| col1 |
+------+
| bag  |
| big  |
| bug  |
+------+
3 rows in set (0.00 sec)

-- Display all the values having any 1 char 
-- between 'b' and 'g' but not alphabet

SELECT * FROM dummy 
WHERE col1 REGEXP 'b[^a-z]g';
 -- ^ in the [] denotes to exclude the range 

+------+
| col1 |
+------+
| b*g  |
+------+
1 row in set (0.00 sec)




-- Display the word b*g
SELECT * FROM dummy
WHERE col1 REGEXP 'b\\*g';
-- \\ means escape sequence


--____________________________________________________________
-- * : means 0 or more occurrences of previous char
-- ? : means 0 or 1 occurrence of previous char
-- + : means 1 or more occurrences of previous char
-- {n} : means n occurrences of previous char
--{m,} : means more than m occurrences of previous char
--{m,n} : means m to n occurrences of previous char
-- () : means grouping. Groups multiple chars

-- repetition (checking based on repetitive patterns)
-- Create a table named repetition with 1 column(col1)

CREATE TABLE repetition(col1 VARCHAR(20));

-- insert the values as below :
-- ww, wow, woow, wooow, woooow, wooooow, woooooow, wooooooow

INSERT INTO repetition
VALUES
('ww'),
('wow'),
('woow'),
('wooow'),
('woooow'),
('wooooow'),
('woooooow');

-- display the table data.
+----------+
| col1     |
+----------+
| ww       |
| wow      |
| woow     |
| wooow    |
| woooow   |
| wooooow  |
| woooooow |
+----------+
7 rows in set (0.00 sec)


-- Display 0 or more occurrences of 'o' from the table.
SELECT * FROM repetition
WHERE col1 REGEXP 'wo*w';


-- Display 0 or 1 occurrences of 'o' from the table.
SELECT * FROM repetition
WHERE col1 REGEXP 'wo?w';

+------+
| col1 |
+------+
| ww   |
| wow  |
+------+
2 rows in set (0.00 sec)


-- Display 1 or more occurrences of 'o' from the table.
SELECT * FROM  repetition
WHERE col1 REGEXP 'wo+w';

-- Display 4 occurrences of 'o' from the table.
SELECT * FROM  repetition
WHERE col1 REGEXP 'wo{4}w';


-- Display 4 or more occurrences of 'o' from the table.
SELECT * FROM  repetition
WHERE col1 REGEXP 'wo{4,}w';

-- Display 3 to 6 occurrences of 'o' from the table.
SELECT * FROM  repetition
WHERE col1 REGEXP 'wo{3,6}w';


--_________________________________________________
-- Pattern checking for valid phone numbers
10 digit : 
[0-9] --> denotes any one digit in the range
[0-9]{10} --> denotes 10 occurances of previous range of digits

+91 :
(\\+91)?[0-9]{10} --> denotes 0 or 1 occurance of the group in round bracket(+91)

0 :
0?[0-9]{10} -->  denotes 0 or 1 occurance  of previous char

(0|\\+91)?[0-9]{10} --> | denotes or 
--() denotes group :
--  in the group of 0 or +91 there can be 0 or 1 occurance






--____________________________________________________
