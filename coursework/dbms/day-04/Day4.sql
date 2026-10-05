/*
AGENDA :
Multi Row functions :
				a) GROUP BY clause
				b) HAVING clause
				c) Having and Where Clause
				d) GROUP BY WITH ROLLUP
				e) GROUPING()

	2. Constraints :
		a) NOT NULL
		b) UNIQUE
		c) PRIMARY KEY
		d) FOREIGN KEY

*/


--__________________________________________________________
--  --MultiRow Functions / Group functions / Aggregate Functions
--Check the SQL_MODE first
/*
SELECT @@sql_mode;
sql_mode is the pre-defined variable having the required settings.
For the group functions to operate properly, we need to add the settings
ONLY_FULL_GROUP_BY to the above variable.
To add the setting we need to use the SET command.

SET @@sql_mode = ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
The SET command does temprory changes to the variable just for the current session/login.
When we exit from mysql the above settings are gone. 


To make the permanent setting for the sql_mode , we need to add these settings
in the my.ini file. 
Path : C:\ProgramData\MySQL\MySQL Server 8.4> my.ini

Open the file.
after the [mysqld]
look for sql-mode = 
Add the setting ONLY_FULL_GROUP_BY

Restart the machine, open mysql and recheck the setting with
SELECT @@sql_mode;
*/

-- Group functions :
/*
Group functions perform operations on the set of rows and
 they return one single output for the entire group. :
 Group functions : MAX,MIN,SUM,AVG,COUNT.

*/

-- Display the sum of salaries of all employees.
SELECT sal FROM emp;
-- 14 rows

SELECT SUM(sal) FROM emp;

+----------+
| SUM(sal) |
+----------+
| 29025.00 |
+----------+


-- display the avg,max,min,sum,count of salaries from emp table. 

SELECT AVG(sal),MAX(sal),MIN(sal),SUM(sal),COUNT(empno)
FROM emp;

+-------------+----------+----------+----------+--------------+
| AVG(sal)    | MAX(sal) | MIN(sal) | SUM(sal) | COUNT(empno) |
+-------------+----------+----------+----------+--------------+
| 2073.214286 |  5000.00 |   800.00 | 29025.00 |           14 |
+-------------+----------+----------+----------+--------------+
1 row in set (0.01 sec)


-- Group functions with NULL

-- Display the avg,max,min,count,sum of comm.
SELECT AVG(comm),MAX(comm),MIN(comm),COUNT(comm),SUM(comm)
FROM emp;

/*
Group functions deal with the NULL values gracefully. They Do not return NULL
if any value is NULL. They perform the operation on other rows which have the
actual values.

The above example shows the COUNT(comm)-> 4. As only 4 emps earn comm, remaining are
NULL.
*/

--____________Rules___________________
--1) Cannot Select a normal column with group function.
/*
eg : SELECT empno,SUM(Sal) FROM emp;
NOT ALLOWED : Error

SELECT empno FROM emp;
returns 14 rows

SELECT SUM(sal) FROM emp;

returns 1 row.

*/

--2) Cannot use single row function with group function
/*
SELECT LOWER(ename),MAX(sal)
FROM emp;
-- NOT ALLOWED : Error

LOWER(ename) returns 14 rows
MAX(sal) returns 1 row
*/

--3) Cannot use group functions in a WHERE clause
/*
-- Display the emp earning max salary :
SELECT empno,ename,sal
FROM emp
WHERE sal = MAX(sal);
-- ERROR :


*/

--4) Cannot call a group function in another group function.
-- Nesting of group functions is not allowed
/*
SELECT AVG(COUNT(sal)) FROM emp;
-- ERROR
*/


--_____________________________________________________
-- GROUP BY : 
-- Display the total salaries of emp department wise

SELECT SUM(Sal)
FROM emp;

-- Total sal of all emps.

SELECT DISTINCT deptno FROM emp;

+--------+
| deptno |
+--------+
|     20 |
|     30 |
|     10 |
+--------+
3 rows in set (0.02 sec)


SELECT deptno,SUM(sal)
FROM emp
GROUP BY deptno;

/*
The GROUP BY clause will create the group of similar rows.
All the rows with deptno 10 are grouped, similarly 20 and 30 are grouped.
The SUM function is applied on each group.
So I can get the total sal on the basis of group of deptno.
*/




-- Display the count of emps department wise
SELECT deptno,COUNT(empno)
FROM emp
GROUP BY deptno;

+--------+--------------+
| deptno | COUNT(empno) |
+--------+--------------+
|     20 |            5 |
|     30 |            6 |
|     10 |            3 |
+--------+--------------+
3 rows in set (0.00 sec)

-- Display the total emps and the salaries in each dept.
SELECT deptno,COUNT(empno),SUM(sal)
FROM emp
GROUP BY deptno;

--------+--------------+----------+
| deptno | COUNT(empno) | SUM(sal) |
+--------+--------------+----------+
|     20 |            5 | 10875.00 |
|     30 |            6 |  9400.00 |
|     10 |            3 |  8750.00 |
+--------+--------------+----------+
3 rows in set (0.00 sec)


-- Display Count of employees job wise.
SELECT job,COUNT(empno)
FROM emp
GROUP BY job;

+-----------+--------------+
| job       | COUNT(empno) |
+-----------+--------------+
| CLERK     |            4 |
| SALESMAN  |            4 |
| MANAGER   |            3 |
| ANALYST   |            2 |
| PRESIDENT |            1 |
+-----------+--------------+
5 rows in set (0.00 sec)

-- Display the count of employees hired each year.
SELECT hire FROM emp
ORDER BY hire;


SELECT YEAR(hire),COUNT(empno)
FROM emp
GROUP BY YEAR(hire);

+------------+--------------+
| YEAR(hire) | COUNT(empno) |
+------------+--------------+
|       1980 |            1 |
|       1981 |           10 |
|       1982 |            2 |
|       1983 |            1 |
+------------+--------------+
4 rows in set (0.02 sec)


-- Display max salary per job.
SELECT job,MAX(sal)
FROM emp
GROUP BY job;

+-----------+----------+
| job       | MAX(sal) |
+-----------+----------+
| CLERK     |  1300.00 |
| SALESMAN  |  1600.00 |
| MANAGER   |  2975.00 |
| ANALYST   |  3000.00 |
| PRESIDENT |  5000.00 |
+-----------+----------+
5 rows in set (0.00 sec)


-- Display the count of employees in every dept for every job profile.

-- check the unique deptnos
SELECT DISTINCT deptno FROM emp;
-- 10,20,30



-- Check the unique job profiles
SELECT DISTINCT job FROM emp;
-- CLERK,SALESMAN,MANAGER,PRESIDENT,ANALYST



-- check unique combination of dept and job

SELECT deptno,job
FROM emp
ORDER BY deptno,job;



SELECT deptno,job,COUNT(empno)
FROM emp
GROUP BY deptno,job
ORDER BY deptno,job;


-- Columns in GROUP BY clause may or may not be the part of SELECT clause.
-- Display count of emps dept wise
SELECT COUNT(empno)
FROM emp
GROUP BY deptno;

+--------------+
| COUNT(empno) |
+--------------+
|            5 |
|            6 |
|            3 |
+--------------+

-- This is allowed, but it does not give the readable / meaningful output.

-- Columns in SELECT clause HAVE TO be the part of GROUP BY clause.



-- Display the dept which spend maximum on the total salaries of employees.


SELECT deptno,SUM(Sal)
FROM emp
GROUP BY deptno
ORDER BY SUM(sal) DESC
LIMIT 1;

+--------+----------+
| deptno | SUM(Sal) |
+--------+----------+
|     20 | 10875.00 |
+--------+----------+
1 row in set (0.00 sec)


-- WHERE clause :
-- Display the dept which spend max on total salaries of emps  
-- other than managers.

SELECT deptno,SUM(sal)
FROM emp
WHERE job != 'manager'
GROUP BY deptno
ORDER BY SUM(sal) DESC
LIMIT 1;

+--------+----------+
| deptno | SUM(sal) |
+--------+----------+
|     20 |  7900.00 |
+--------+----------+
1 row in set (0.02 sec)

--__________________________________________________________
/*
WHERE clause is used to apply the filter on the rows.
Having clause is used to filter the groups.
*/

-- HAVING clause : 
-- Filtering the groups


-- Display all the jobs which have more than 3 emps working in it.

-- check the count of emps in each job
SELECT job,COUNT(empno)
FROM emp
GROUP BY job;

+-----------+--------------+
| job       | COUNT(empno) |
+-----------+--------------+
| CLERK     |            4 |
| SALESMAN  |            4 |
| MANAGER   |            3 |
| ANALYST   |            2 |
| PRESIDENT |            1 |
+-----------+--------------+
5 rows in set (0.00 sec)


-- Filter out only those groups where the count is more than 3
SELECT job,COUNT(empno)
FROM emp
GROUP BY job
HAVING COUNT(empno) > 3;

+----------+--------------+
| job      | COUNT(empno) |
+----------+--------------+
| CLERK    |            4 |
| SALESMAN |            4 |
+----------+--------------+
2 rows in set (0.01 sec)


/*
 HAVING clause is used to perform the conditions based on the groups.
 It should be written after the GROUP BY clause.
*/

-- Display the departments which have the 
-- average salary more than 2500.
-- display avg sal dept wise
SELECT deptno,AVG(sal)
FROM emp
GROUP BY deptno;

+--------+-------------+
| deptno | AVG(sal)    |
+--------+-------------+
|     20 | 2175.000000 |
|     30 | 1566.666667 |
|     10 | 2916.666667 |
+--------+-------------+
3 rows in set (0.01 sec)

-- filter out the depts which have avg sal > 2500.
SELECT deptno,AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal) > 2500;

+--------+-------------+
| deptno | AVG(sal)    |
+--------+-------------+
|     10 | 2916.666667 |
+--------+-------------+
1 row in set (0.01 sec)


-- _________________________________________________
-- Understanding the internal working of queries and choosing the efficient one.


-- Display the count of employees jobwise for manager
--  and analyst.

SELECT job,COUNT(empno)
FROM emp
WHERE job IN ('manager','analyst')
GROUP BY job;


SELECT job,COUNT(empno)
FROM emp
GROUP BY job
HAVING job IN ('manager','analyst');
-- Not Efficient 
/*
Use the WHERE clause to restrict the rows.
USE the HAVING clause to RESTRICT the groups.
*/



-- Display jobs which have avg salaries < 2000.

SELECT job,AVG(sal)
FROM emp
GROUP BY job
HAVING AVG(sal) < 2000;



-- Display deptwise total sals of managers ,analysts and clerks 
-- but Only For dept 10 and 20.

SELECT deptno,SUM(Sal)
FROM emp
WHERE job IN('manager','analyst','clerk')
AND 
deptno IN(10,20)
GROUP BY deptno;


/*
Display the count of emps jobwise, 
excluding managers and presidents
But display the jobs which have the count greater than 2
*/

SELECT job,COUNT(empno)
FROM emp
WHERE job NOT IN('manager','president')
GROUP BY job
HAVING COUNT(empno) > 2;


-- Display the total price of all subjects(groupwise)  
-- from the books table whose total price is greater than 1500.

SELECT subject,SUM(price)
FROM books
GROUP BY subject
HAVING SUM(price) > 1500;

+------------------+------------+
| subject          | SUM(price) |
+------------------+------------+
| C++ Programming  |   1976.281 |
| Java Programming |   1536.098 |
+------------------+------------+
2 rows in set (0.00 sec)




/*
SELECT col1,col2...
FROM tbl
WHERE condition for rows
GROUP BY col1,col2
HAVING condition for group
ORDER BY col1,col2...
LIMIT m,n;

*/

--_____________ Group By withRollup________________________
-- Write a query to display the total salary paid in each department 
--using GROUP BY along with total salary of all departments.

-- 1) Display Total sal from the emp table.
SELECT SUM(Sal) FROM emp;

+----------+
| SUM(Sal) |
+----------+
| 29025.00 |
+----------+

-- 2) display dept wise total sal.
SELECT deptno,SUM(Sal)
FROM emp
GROUP BY deptno;

+--------+----------+
| deptno | SUM(Sal) |
+--------+----------+
|     20 | 10875.00 |
|     30 |  9400.00 |
|     10 |  8750.00 |
+--------+----------+

-- My requirement

+--------+----------+
| deptno | SUM(Sal) |
+--------+----------+
|     20 | 10875.00 |
|     30 |  9400.00 |
|     10 |  8750.00 |
+--------+----------+
		+----------+
Total	| 29025.00 |
		+----------+

(SELECT deptno,SUM(Sal)
FROM emp
GROUP BY deptno)

UNION

(SELECT NULL,SUM(sal)
FROM emp);



-- Write a query to display department-wise totals 
--and grand total using GROUP BY WITH ROLLUP.

SELECT deptno,SUM(sal)
FROM emp
GROUP BY deptno WITH ROLLUP;

+--------+----------+
| deptno | SUM(sal) |
+--------+----------+
|     10 |  8750.00 |
|     20 | 10875.00 |
|     30 |  9400.00 |
|   NULL | 29025.00 |
+--------+----------+


SELECT IFNULL(deptno,"Total") AS deptno,SUM(sal)
FROM emp
GROUP BY deptno WITH ROLLUP;

+--------+----------+
| deptno | SUM(sal) |
+--------+----------+
| 10     |  8750.00 |
| 20     | 10875.00 |
| 30     |  9400.00 |
| Total  | 29025.00 |
+--------+----------+
4 rows in set, 1 warning (0.02 sec)


-- Write a query to display department, job, employee count, and total salary 
-- grouped by dept as well as job.

SELECT deptno,job,COUNT(empno),SUM(Sal)
FROM emp
GROUP BY deptno,job
ORDER BY deptno,job;



-- Write a query to display department-job summary using GROUP BY WITH ROLLUP.
SELECT deptno,job,COUNT(empno),SUM(sal)
FROM emp
GROUP BY deptno,job WITH ROLLUP;


-- Write a query to perform ROLLUP on job first, then department.
SELECT job,deptno,COUNT(empno),SUM(Sal)
FROM emp
GROUP BY job,deptno WITH ROLLUP;

--_______________________________________________________
/*
The GROUPING() function is used with ROLLUP 
to tell whether a NULL value in the result is:
a real NULL from the data, or
a NULL added by SQL for subtotal / total rows

 Why do we need it?
When you use ROLLUP, SQL inserts NULL values to represent totals.
But sometimes your actual data may also contain NULL.

So how do you tell the difference?
That’s exactly what GROUPING() solves.

| Value | Meaning                         |
| ----- | ------------------------        |
| 0     | Real value - NULL (from table)  |
| 1     | Generated by ROLLUP        |

*/

-- GROUPING()

SELECT deptno,job,COUNT(empno),SUM(sal),GROUPING(job)
FROM emp
GROUP BY deptno,job WITH ROLLUP;


-- Write a query to show only the sub-totals and grand-total. 
-- Filter out other rows. Hint: GROUPING()
SELECT deptno,job,COUNT(empno),SUM(Sal),GROUPING(job)
FROM emp
GROUP BY deptno,job WITH ROLLUP
HAVING GROUPING(job) = 1;


--_____________________________________________________________

--___________________________Constraints :_______________________
/*
Constraints are the limitations/restrictions imposed on the columns
for the data to be entered.
*/

-- NOT NULL : if we apply NOT NULL constraint on a column, it ensures that the
-- values for that column are not null. It can have duplicate values.
-- NOT NULL is a column level constraint
-- means, it has to be mentioned with the coulmn name.


-- Create a contacts table
    -- name varchar(20) should be not null
    -- phone char (14)
    -- email varchar(20)


CREATE TABLE contacts
(
name VARCHAR(20) NOT NULL,
phone char(15),
email VARCHAR(20)
);



INSERT INTO CONTACTS VALUES('Nisha','123456','Nisha@gmail.com');

INSERT INTO CONTACTS VALUES(NULL,'456788','abc@xyz.com');
-- ERROR 1048 (23000): Column 'name' cannot be null

INSERT INTO CONTACTS(phone,email) VALUES('123455','qwe@asd.com');
-- ERROR 1364 (HY000): Field 'name' doesn't have a default value

INSERT INTO CONTACTS VALUES('Nisha','123456','Nisha@gmail.com');-- duplicates are allowed.


--___________________________________________
-- Unique constraint :
/*
Unique constraint ensures unique values are entered into that column.
this constraint is similar to UNIQUE index.
Constraints can be added at the time of table creation,
 but index can be created only after the table is created.

Internally, the unique index is created on the column on which we have added the
unique constraint. Hence the unique contraint ensures unique values to be inserted
in that column as well as the searching is faster as the index is internally created
for that column. 
*/

/*
Create a contacts table :
name , phone, email)
make phone number as unique at table level
and email as unique at column level
*/

DROP TABLE IF EXISTS contacts;

CREATE TABLE CONTACTS
(
	name VARCHAR(20) NOT NULL,
	phone CHAR(15),
	email VARCHAR(20) UNIQUE,    -- column level syntax
	UNIQUE(phone)                -- Table level syntax
);


mysql> DESC contacts;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(20) | NO   |     | NULL    |       |
| phone | char(15)    | YES  | UNI | NULL    |       |
| email | varchar(20) | YES  | UNI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.06 sec)

-- OR 
-- Give name to the constraint at the table level syntax only.
-- Names at the column level syntax are not allowed.


DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts
(
	name VARCHAR(20) NOT NULL,
	phone CHAR(15),
	email VARCHAR(20),
	CONSTRAINT uni_ph UNIQUE(phone),
	CONSTRAINT uni_email UNIQUE(email)
);

INSERT INTO contacts VALUES('nisha','123456','nisha@gmail.com');

INSERT INTO contacts VALUES('nisha','123456','n@gmail.com');
-- ERROR 1062 (23000): Duplicate entry '123456' for key 'contacts.uni_ph'

INSERT INTO contacts VALUES('nisha','12345678','n@gmail.com');

INSERT INTO contacts VALUES('nisha','123456789','n@gmail.com');
-- ERROR 1062 (23000): Duplicate entry 'n@gmail.com' for key 'contacts.uni_email'

INSERT INTO contacts VALUES('nisha','11122234',NULL);

INSERT INTO contacts VALUES('nisha','1344656',NULL);
-- Multiple NULL values ARE ALLOWED 

/*
UNIQUE contraint is a column level as well as table level contraint.
Means we can specify this in 2 ways.
*/

-- At table level we can give name to the constraint.
-- Unique constarint can be table level as well as column level.
-- unique column does not allow duplicate values.
-- You can insert NULL values.
-- Any number of NULL values are allowed in a unique column 
-- as NULL is not a valid value to be compared. NULL means NOTHING. 
-- Internally a unique index is created for the column on 
--which we create a unique constraint.
-- We can check the index by SHOW INDEXES FROM table;


--________________________________________________
-- Primary Key :
/*

Primary key helps to uniquely identify rows from one another.
For a primary key column, the data should be UNIQUE and NOT NULL.
It is recommended that every table should have a primary key column.
It is a table level and column level constraint.
A table MUST have ONLY ONE PRIMARY KEY.
*/

--Create a table customers with name,email,phone,addr.

-- column level syntax

CREATE TABLE customers
(
	name VARCHAR(20),
	email VARCHAR(20) PRIMARY KEY,
	phone CHAR(15),
	addr VARCHAR(90)
);

mysql> DESC customers;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(20) | YES  |     | NULL    |       |
| email | varchar(20) | NO   | PRI | NULL    |       |
| phone | char(15)    | YES  |     | NULL    |       |
| addr  | varchar(90) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


--OR
-- table level syntax without the constraint name

DROP TABLE IF EXISTS customers;

CREATE TABLE customers
(
	name VARCHAR(20),
	email VARCHAR(20),
	phone CHAR(15),
	addr VARCHAR(90),
	PRIMARY KEY(email)
);

-- OR
-- table level with constraint name
DROP TABLE IF EXISTS customers;

CREATE TABLE customers
(
	name VARCHAR(20),
	email VARCHAR(20),
	phone CHAR(15),
	addr VARCHAR(90),
	CONSTRAINT pk_email PRIMARY KEY(email)
);

--____________________________________________________________
-- Composite Primary Key 
-- Create a table student with roll_no,std,name,marks

/*
std    roll_no     name     marks
1        1          A         90
1        2          B         92
1        3          C         94
2        1          D         80
2        2          E         85
2        3          F         97
3        1          G         93
3        2          H         95
3        3          I         98
*/


DROP TABLE IF EXISTS students;

CREATE TABLE students
(
	std INT,
	roll_no INT,
	name VARCHAR(20),
	marks FLOAT,
	PRIMARY KEY(std,roll_no)
);


mysql> DESC students;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| std     | int         | NO   | PRI | NULL    |       |
| roll_no | int         | NO   | PRI | NULL    |       |
| name    | varchar(20) | YES  |     | NULL    |       |
| marks   | float       | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)



-- composite primary key should compulsorily mentioned at the table level.



--_______________________________________________________
-- Surrogate Primary Key with auto_increment:


-- Create a table products : 

--product_name,category,brand,		pages,  price,	quantity 
book        stationary   classmate   100		50      2
book        stationary   classmate   200      70       3
book        stationary    doms        100     50      2
book        stationary    doms      200     


/*
HEre we have to take the help of an extra column to identify each row uniquely. We can use Product_id in that case.
Such primary key is called as surrogate Primary key.
*/
DROP TABLE IF EXISTS products;

CREATE TABLE products
(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(20),
	category VARCHAR(20),
	brand VARCHAR(30),
	price DOUBLE
)AUTO_INCREMENT 100;

INSERT INTO products(product_name,price) VALUES('book',20);
INSERT INTO products(product_name,price) VALUES('pencil',10);
INSERT INTO products(product_name,price) VALUES('sketch_pen',20);

mysql> SELECT * FROM products;
+------------+--------------+----------+-------+-------+
| product_id | product_name | category | brand | price |
+------------+--------------+----------+-------+-------+
|          1 | book         | NULL     | NULL  |    20 |
|          2 | pencil       | NULL     | NULL  |    10 |
|          3 | sketch_pen   | NULL     | NULL  |    20 |
+------------+--------------+----------+-------+-------+
3 rows in set (0.00 sec)

ALTER TABLE products AUTO_INCREMENT 500;

INSERT INTO products(product_name,price) VALUES('pen',20);

mysql> SELECT * FROM products;
+------------+--------------+----------+-------+-------+
| product_id | product_name | category | brand | price |
+------------+--------------+----------+-------+-------+
|        100 | book         | NULL     | NULL  |    20 |
|        101 | pencil       | NULL     | NULL  |    10 |
|        102 | sketch_pen   | NULL     | NULL  |    20 |
|        500 | pen          | NULL     | NULL  |    20 |
+------------+--------------+----------+-------+-------+
4 rows in set (0.00 sec)


--____________________________________________
-- foreign key

-- create the d1 table and e1 table with primary and foreign key 
--for deptno and mgr.

CREATE TABLE D1
(
	deptno INT PRIMARY KEY,
	dname VARCHAR(20)
);

DROP TABLE IF EXISTS E1;


CREATE TABLE E1
(
	empno INT PRIMARY KEY,
	ename VARCHAR(20),
	deptno INT,
	sal DOUBLE,
	mgr INT,
	CONSTRAINT fk_deptno FOREIGN KEY(deptno) REFERENCES D1(deptno),
	CONSTRAINT fk_mgrno FOREIGN KEY(mgr) REFERENCES E1(empno)
);


INSERT INTO D1 VALUES(10,'Training');
INSERT INTO D1 VALUES(20,'Sales');
INSERT INTO D1 VALUES(30,'Marketing');

+--------+-----------+
| deptno | dname     |
+--------+-----------+
|     10 | Training  |
|     20 | Sales     |
|     30 | Marketing |
+--------+-----------+
3 rows in set (0.00 sec)

INSERT INTO E1 VALUES(101,'ABC',10,10000,NULL);
INSERT INTO E1 VALUES(102,'XYZ',20,2000,101);
/*
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`classwork_db`.`e1`, CONSTRAINT `e1_ibfk_1` FOREIGN KEY (`deptno`) REFERENCES `d1` (`deptno`))
*/


INSERT INTO E1 VALUES(103,'MNO',30,30000,104);
-- giving NULL for the foreign key column is allowed

INSERT INTO E1 VALUES(104,'XYZ',10,10000);
-- Duplicate Values are allowed 
+-------+-------+--------+-------+
| empno | ename | deptno | sal   |
+-------+-------+--------+-------+
|   101 | ABC   |     10 | 10000 |
|   103 | MNO   |   NULL | 30000 |
|   104 | XYZ   |     10 | 10000 |
+-------+-------+--------+-------+
3 rows in set (0.00 sec)


-- @@foreign_key_checks :

/*
By default the variable value is true (1). 
It means for every DML the foreign key constraint is checked.
*/


mysql> SELECT @@foreign_key_checks;
+----------------------+
| @@foreign_key_checks |
+----------------------+
|                    1 |
+----------------------+
1 row in set (0.01 sec)



-- We can disable the foreign key checking for sometime 
-- during data migration.

mysql> SET @@foreign_key_checks = 0;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT @@foreign_key_checks;
+----------------------+
| @@foreign_key_checks |
+----------------------+
|                    0 |
+----------------------+
1 row in set (0.00 sec)





-- After the job is done , we should again enable it.
mysql> SET @@foreign_key_checks = 1;
Query OK, 0 rows affected (0.00 sec)



--_______________________________________________