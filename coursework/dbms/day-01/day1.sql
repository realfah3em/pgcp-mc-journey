-- Open Command Prompt
-- Login through root user 
cmd > mysql -u root -p
cmd > Enter password : manager

mysql > 
/*
Login to mysql
-u means username
-p means password
*/

-- password should be without the spaces between -p
cmd > mysql -u root -pmanager


--root is the main user(Admin : having all the rights on all the databases)
--__________________________________________________________________

-- to display all the databases under the current user.
mysql > SHOW DATABASES;


-- Create a database named classwork_db
-- syntax : CREATE DATABASE db_name;
mysql> CREATE DATABASE classwork_db;


-- To clear the screen
mysql > \! cls


-- to see the created database
mysql > SHOW DATABASES;


-- Create a new user as sunbeam with password as sunbeam
-- username : sunbeam
-- password : sunbeam
-- SYNTAX : CREATE USER username IDENTIFIED BY 'pwd';
mysql > CREATE USER sunbeam IDENTIFIED BY 'sunbeam'; 

-- To check the user created :
-- The table user contains the column name as user. 

-- Activate the mysql database :
USE mysql;

SELECT user FROM user;
-- user is a column from the table user.

-- Select the database
USE classwork_db;

-- root needs to give all the permissions on classwork database 
-- to sunbeam user.
-- syntax :  GRANT privileges ON database_name TO username;

GRANT ALL PRIVILEGES ON classwork_db.* TO sunbeam;


-- exit from root login and relogin through sunbeam user
exit

cmd > mysql -u sunbeam -psunbeam
-- localhost :clent is connected to the server on the same / local machine

cmd > mysql -u sunbeam -h "host ip address" -psunbeam

/*
-h : means the host machines ip address
*/

-- select the database.
USE classwork_db

-- relogin through sunbeam user and select database simultaneously.
cmd > mysql -u sunbeam -psunbeam classwork_db

-- check the current user and current database.
mysql> SELECT DATABASE(),USER();
+--------------+-------------------+
| DATABASE()   | USER()            |
+--------------+-------------------+
| classwork_db | sunbeam@localhost |
+--------------+-------------------+
1 row in set (0.01 sec)

-- to see the tables in the current database.
SHOW TABLES;
-- empty set 


-- Create a student table
-- roll_no : INT
-- Name : char(20)
-- Marks : double

--syntax : 
-- CREATE TABLE table_name (col1 datatype,col2 datatype,.....);
CREATE TABLE students(roll_no INT,name CHAR(20),marks DOUBLE);


-- To see the data from the table use SELECT(DQL) command.
--syntax : 
mysql> SELECT * FROM students;
Empty set (0.01 sec)

-- * means all the columns

-- to see the table structure :
DESCRIBE students;
-- OR 
DESC students;

-- to insert the data into the table use INSERT(DML) command
-- syntax : INSERT INTO tbl_name VALUES(v1,v2,v3....);

INSERT INTO students VALUES(1,'Rahul',90);
INSERT INTO students VALUES(2,'lakshay',99);
INSERT INTO students VALUES(3,'harsh',95);

-- to display the data from the students table
SELECT * FROM students;


--________________________________________________________________

-- understanding the installations.
-- server : mysqld.exe (d -> deamon) : running prog in the background : NO GUI

-- clients :    
-- 1) mysql.exe : MySQL CLI (Command Line Interface)
-- 2) Mysqlsh : Mysql Shell (advanced features of Mysql)
-- 3) MySql Workbench : GUI based client


-- Understanding the physical and logical layout of the database :
-- Refer PDF.


-- ________________________Datatypes________________________ 
-- Numeric Types : Refer PDF
    -- int
    -- float

-- DateTime types :

-- String types :
-- Understanding the difference between char varchar and text.
-- Create a table temp with 3 columns
-- col1 CHAR(4), col2 VARCHAR(4),col3 TEXT(4)

CREATE TABLE temp(col1 CHAR(4),col2 VARCHAR(4),col3 TEXT(4));

mysql> DESC temp;
+-------+------------+------+-----+---------+-------+
| Field | Type       | Null | Key | Default | Extra |
+-------+------------+------+-----+---------+-------+
| col1  | char(4)    | YES  |     | NULL    |       |
| col2  | varchar(4) | YES  |     | NULL    |       |
| col3  | tinytext   | YES  |     | NULL    |       |
+-------+------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


-- Insert the values into temp table

INSERT INTO temp VALUES('AA','AA','AA');

INSERT INTO temp VALUES('AAA','AAA','AAA');

INSERT INTO temp VALUES('AAAA','AAAA','AAAA');

INSERT INTO temp VALUES('AAAAA','AAAA','AAAA');
-- ERROR 1406 (22001): Data too long for column 'col1' at row 1

INSERT INTO temp VALUES('AAAA','AAAAA','AAAA');
-- ERROR 1406 (22001): Data too long for column 'col2' at row 1

INSERT INTO temp VALUES('AAAA','AAAA','AAAAA'); -- allowed
-- Query OK, 1 row affected (0.01 sec)


-- To display the table structure.
DESC temp;

-- ___________________________________________________________________

--Binary types :
-- Refer PDF

-- Miscellaneous types :
-- Refer PDF


--_________________________________________________________
-- Create an employee table
-- emp_id : INT
-- emp_name :VARCHAR(20)
-- salary : DECIMAL(9,2)
-- designation : CHAR(20)
-- comm : FLOAT
-- hire_date : DATE


CREATE TABLE employee 
(emp_id INT,
emp_name VARCHAR(20),
salary DECIMAL(9,2),
designation CHAR(20),
comm FLOAT,
hire_date DATE
);


-- Shows the table structure : the columns with the corresponding datatypes.

DESCRIBE employee;


+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| emp_id      | int          | YES  |     | NULL    |       |
| emp_name    | varchar(20)  | YES  |     | NULL    |       |
| salary      | decimal(9,2) | YES  |     | NULL    |       |
| designation | char(20)     | YES  |     | NULL    |       |
| comm        | float        | YES  |     | NULL    |       |
| hire_date   | date         | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)


-- INSERT continued
-- INSERT is a DML(Data Manipulation Language) command.

INSERT INTO employee VALUES(101,'Ram',10000,'Intern',0.1,'2026-08-20');
-- Date and char types should be enclosed in single / double quotes.


INSERT INTO employee VALUES(102,'Sham',11000,'Intern',NULL,NULL);
-- NULL is absence of value.


INSERT INTO employee(emp_id,emp_name,salary) VALUES(103,'Seeta',12000);

INSERT INTO employee(emp_name,salary,emp_id)VALUES ('Geeta',12000,104);


INSERT INTO employee(emp_id,emp_name,salary,designation) 
VALUES(105,'Nirmal',10000,'Manager'),
(106,'Pushkar',10000,'HR'),
(107,'Punit',10000,'Sales');


mysql> SELECT * FROM employee;
+--------+----------+----------+-------------+------+------------+
| emp_id | emp_name | salary   | designation | comm | hire_date  |
+--------+----------+----------+-------------+------+------------+
|    101 | Ram      | 10000.00 | Intern      |  0.1 | 2026-08-20 |
|    102 | Sham     | 11000.00 | Intern      | NULL | NULL       |
|    103 | Seeta    | 12000.00 | NULL        | NULL | NULL       |
|    104 | Geeta    | 12000.00 | NULL        | NULL | NULL       |
|    105 | Nirmal   | 10000.00 | Manager     | NULL | NULL       |
|    106 | Pushkar  | 10000.00 | HR          | NULL | NULL       |
|    107 | Punit    | 10000.00 | Sales       | NULL | NULL       |
+--------+----------+----------+-------------+------+------------+
7 rows in set (0.01 sec)

-- Create a new table with the name new_students. 
-- Copy the data from the students table into the new_students table.

CREATE TABLE new_students(roll_no INT,name VARCHAR(20),marks FLOAT);

INSERT INTO new_students SELECT * FROM students;


INSERT INTO new_students(roll_no,name) SELECT roll_no,name FROM students;



-- ___________________SQL Script_______________________________

-- USE source command to import the file.
 SOURCE path_of_the_.sql_file

 SOURCE "E:\August_2026\PG\PGMC_DBT\databases\classwork-db.sql"
-- OR
 SOURCE (drag and drop the file)

-- _________________________________________________________________
--Projection : Display specific columns

-- Display all columns
SELECT * FROM emp;
-- * means all the columns 

-- Display empno, ename and sal from the emp table.
--Syntax : 
SELECT empno,ename,sal FROM emp;


-- Display the empno, hiredate, sal and comm of all the emps.
SELECT empno,hire,sal,comm FROM emp;

-- Display empno, ename,salary and allowance(50% of sal)
SELECT empno,ename,sal, sal * 0.5
FROM emp;

SELECT empno,ename,sal, sal * 0.5 AS "allowance"
FROM emp;

SELECT empno,ename,sal, sal * 0.5 allowance
FROM emp;

-- display the empno, name, sal, allowance(sal * 0.5) 
--and total sal(sal+allowance)


SELECT empno,ename,sal,sal *0.5 allowance, sal + allowance AS total_sal
FROM emp;
-- ERROR 1054 (42S22): Unknown column 'allowance' in 'field list'


SELECT empno,ename,sal,sal*0.5 AS allowance, sal+ sal*0.5 AS total_sal
FROM emp;


--______________________________CASE_________________________________________

-- Display the empno,ename,deptno, 
--deptname(for deptno 10 display Administration)


/*
CASE
WHEN condition THEN action
WHEN condition THEN action
WHEN condition THEN action
ELSE action
END


*/
SELECT empno,ename,deptno,
CASE
WHEN deptno = 10 THEN "Administration"
END AS dept_name
FROM emp;



/*
Display the ename,deptno and the dept name as administration for deptno 10,
Testing for deptno 20 and development for deptno 30.
*/

SELECT ename,deptno,
CASE
WHEN deptno = 10 THEN "administration"
WHEN deptno = 20 THEN "Testing"
WHEN deptno = 30 THEN "development"
END AS dept_name
FROM emp;


-- OR

SELECT ename,deptno,
CASE deptno
WHEN 10 THEN "Administration"
WHEN 20 THEN "Testing"
WHEN 30 THEN "development"
END AS deptname
FROM emp;


/* We can use the above syntax for CASE when the conditions are based only on one column for
equality condition.
for eg : in the above query, we are checking only for the deptno no column.
*/

--_________________________________________________________________
/*
Display the empno,ename,sal and status :
if sal below 2500 display : below avg
if sal is between 2500 and 4000 display : Avg
else display above avg
*/

SELECT empno,ename,sal,
CASE
WHEN sal < 2500 THEN "Below Avg"
WHEN sal >= 2500 AND sal <= 4000 THEN "Avg"
ELSE "Above Avg"
END AS status
FROM emp;


/*
Case with computed columns
Display empno,ename,sal, deptno,
For dept 10 print bonus as sal * 0.10
For dept 20 print bonus sal * 0.20
For dept 30 print bonus sal * 0.30
*/
SELECT empno,ename,sal,deptno,
CASE 
WHEN deptno = 10 THEN sal * 0.10
WHEN deptno = 20 THEN sal * 0.20
WHEN deptno = 30 THEN sal * 0.30
END AS "Bonus"
FROM emp;



--__________________________________________________________