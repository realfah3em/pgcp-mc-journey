/*
AGENDA :
    1. Constraints :
            Foreign Key : ON DELETE CASCADE, ON UPDATE CASCADE
            CHECK constriant 

    2. JOINS :
            Table Relations 
            Joining 2 or more tables.
            Joins with group by , order by

    3. Indexes :
        Simple Index
        Unique Index
        Composite Index
*/

--__________________________________________________________
-- ON UPDATE CASCADE / ON DELETE CASCADE
/*
Deleting dept no 40 is allowed as there is not child row dependent
on it in the e1 table.
If we have to delete the parent row, we should first delete the child row from the e1 table and then delete the corresponding parent row from the d1 table.
*/


mysql> SELECT * FROM D1;
+--------+------------+
| deptno | dname      |
+--------+------------+
|     10 | Training   |
|     20 | Sales      |
|     30 | Marketing  |
|     40 | IT         |
|     50 | Management |
+--------+------------+
5 rows in set (0.00 sec)






mysql> SELECT * FROM E1;
+-------+-------+--------+-------+------+
| empno | ename | deptno | sal   | mgr  |
+-------+-------+--------+-------+------+
|   101 | ABC   |     10 | 10000 | NULL |
|   102 | XYZ   |     20 |  2000 |  101 |
|   103 | PQR   |     10 | 10000 |  101 |
|   104 | AAA   |     20 |  5000 |  102 |
|   105 | BBB   |     30 | 14000 |  103 |
+-------+-------+--------+-------+------+
5 rows in set (0.00 sec)


mysql> DELETE FROM D1 WHERE deptno = 10;
-- ERROR 1451 (23000): Cannot delete or update a parent row: 
--a foreign key constraint fails (`classwork_db`.`e1`, CONSTRAINT `e1_ibfk_1` FOREIGN KEY (`deptno`) REFERENCES `d1` (`deptno`))


/*
Deptno 10 is not allowed to delete, because it has the child rows in the E1 child table.
But , if we try to delete a dept from D1 table which does not have any child, rows, it will be allowed to be deleted.
*/

DELETE FROM D1 WHERE deptno = 50;
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM D1;
+--------+-----------+
| deptno | dname     |
+--------+-----------+
|     10 | Training  |
|     20 | Sales     |
|     30 | Marketing |
|     40 | IT        |
+--------+-----------+
4 rows in set (0.00 sec)


DELETE FROM E1 WHERE empno = 101;
/*
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`classwork_db`.`e1`, CONSTRAINT `e1_ibfk_2` FOREIGN KEY (`mgr`) REFERENCES `e1` (`empno`))
*/
This is also not allowed as, empno is primary key against the mgr foreign key.
And 101 has the child rows.

UPDATE D1 SET deptno = 60
WHERE deptno = 20;

/*
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`classwork_db`.`e1`, CONSTRAINT `e1_ibfk_1` FOREIGN KEY (`deptno`) REFERENCES `d1` (`deptno`))
*/


DROP TABLE IF EXISTS E1;
CREATE TABLE E1
(
        empno INT PRIMARY KEY,
        name VARCHAR(20),
        deptno INT,
        sal DOUBLE,
        mgr INT,
        FOREIGN KEY(deptno) REFERENCES D1(deptno) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY(mgr) REFERENCES E1(empno) ON DELETE CASCADE
);

INSERT INTO E1 VALUES(101,'AAA',10,10000,NULL);
INSERT INTO E1 VALUES(102,'BBB',10,2000,101);
INSERT INTO E1 VALUES(103,'CCC',20,4000,101);
INSERT INTO E1 VALUES(104,'DDD',30,1000,102);
INSERT INTO E1 VALUES(105,'EEE',20,2000,103);
INSERT INTO E1 VALUES(106,'FFF',40,2000,NULL);


mysql> SELECT * FROM E1;
+-------+------+--------+-------+------+
| empno | name | deptno | sal   | mgr  |
+-------+------+--------+-------+------+
|   101 | AAA  |     10 | 10000 | NULL |
|   102 | BBB  |     10 |  2000 |  101 |
|   103 | CCC  |     20 |  4000 |  101 |
|   104 | DDD  |     30 |  1000 |  102 |
|   105 | EEE  |     20 |  2000 |  103 |
|   106 | FFF  |     40 |  2000 | NULL |
+-------+------+--------+-------+------+
6 rows in set (0.01 sec)

mysql> SELECT * FROM D1;
+--------+-----------+
| deptno | dname     |
+--------+-----------+
|     10 | Training  |
|     20 | Sales     |
|     30 | Marketing |
|     40 | IT        |
+--------+-----------+
4 rows in set (0.00 sec)

mysql> DELETE FROM D1 WHERE deptno = 40;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM D1;
+--------+-----------+
| deptno | dname     |
+--------+-----------+
|     10 | Training  |
|     20 | Sales     |
|     30 | Marketing |
+--------+-----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM E1;
+-------+------+--------+-------+------+
| empno | name | deptno | sal   | mgr  |
+-------+------+--------+-------+------+
|   101 | AAA  |     10 | 10000 | NULL |
|   102 | BBB  |     10 |  2000 |  101 |
|   103 | CCC  |     20 |  4000 |  101 |
|   104 | DDD  |     30 |  1000 |  102 |
|   105 | EEE  |     20 |  2000 |  103 |
+-------+------+--------+-------+------+
5 rows in set (0.00 sec)


-- Because of ON DELETE CASCADE the corresponding child row in the E1 table is also deleted when we delete the parent row of dept 40 from D1 table.

--______________________________________________________
-- CHECK constraint :
/*
Create a check_emp table
emp_id INT : 
emp_name varchar(20):
 age INT: should be between 20 to 65
 salary DECIMAL(8,2): should be greater than 1000
 comm INT: should be between 500 and 800
 total salary  (salary + comm) should be greater 1200
*/


CREATE TABLE check_emp
(
        empno INT PRIMARY KEY,
        ename VARCHAR(20),
        age INT CHECK (age BETWEEN 20 AND 65),
        salary DECIMAL(9,2) CHECK(salary > 1000),
        comm INT CHECK (comm BETWEEN 500 AND 800),
        CHECK(salary+comm >= 1200)
);

INSERT INTO check_emp VALUES(111,'ABC',21,1100,500);

INSERT INTO check_emp VALUES(222,'ABC',19,1100,500);
-- ERROR 3819 (HY000): Check constraint 'check_emp_chk_1' is violated.

INSERT INTO check_emp VALUES(333,'ABC',29,1000,500);
-- ERROR 3819 (HY000): Check constraint 'check_emp_chk_2' is violated.

INSERT INTO check_emp VALUES(444,'ABC',29,1500,200);
-- ERROR 3819 (HY000): Check constraint 'check_emp_chk_3' is violated.


INSERT INTO check_emp VALUES(555,'ABC',29,1500,NULL);
/*
allowed. values for the columns in chk constraint can be NULL,
but if we insert some value, we must take care to insert it in that given range.
*/
--______________________________________________________
/*
LAB WORK :
Create a emp1 table with following constraints

emp_id INT primary key
emp_name VARCHAR(20) should not be null
email VARCHAR(30) should be unique
age INT should be 20 and above
salary DECIMAL(8,2) should be greater than 1000
manager_id INT should have a valid mgr id
Incentives INT should be more than 500
*/
CREATE TABLE emp1
(emp_id INT PRIMARY KEY,
emp_name VARCHAR(20) NOT NULL,
email VARCHAR(30) UNIQUE,
age INT CHECK(age >= 20),
salary DECIMAL(8,2) CHECK (salary >=1000),
mgr_id INT,
Incentives INT CHECK(Incentives >= 500),
FOREIGN KEY mgr_id REFERENCES emp1(emp_id)
);

/*
ALTER TABLE syntax for table level constraints :

ALTER TABLE tb_name ADD const_name(col1);

ALTER TABLE emp ADD UNIQUE(email);
OR
ALTER TABLE emp ADD CONSTRIANT uni_email UNIQUE(email);


As NOT NULL is the column level contraint, 
we can add that with the Modify keyword.
ALTER TABLE emp MODIFY COLUMN ename VARCHAR(20) NOT NULL;
*/

--_______________________JOINS__________________________________

-- check all the tables 

-- emps
SELECT * FROM emps;

--depts
SELECT * FROM depts;

-- addr
SELECT * FROM addr;
-- emp_meeting
SELECT * FROM emp_meeting;

-- meeting
SELECT * FROM meeting;

--_____________________________________
-- CROSS JOIN
-- Display all the possible combinations 
--from the emps and depts tables


SELECT empno,ename,deptno,dname
FROM emps CROSS JOIN depts;
-- ERROR 1052 (23000): Column 'deptno' in field list is ambiguous
-- _________________________________________________
SELECT empno,ename,emps.deptno,dname
FROM emps CROSS JOIN depts;

SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e CROSS JOIN dept d;


--__________________________________________________
-- INNER JOIN
-- Display the empno,ename,deptno, deptname for each emp 
-- matching with depts table.

SELECT empno,ename,emps.deptno,dname
FROM emps INNER JOIN depts
ON emps.deptno = depts.deptno;

SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e INNER JOIN depts d
ON e.deptno = d.deptno;

+-------+--------+--------+-------+
| empno | ename  | deptno | dname |
+-------+--------+--------+-------+
|     1 | Amit   |     10 | DEV   |
|     2 | Rahul  |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
+-------+--------+--------+-------+
3 rows in set (0.00 sec)



--___________________________________________
-- LEFT OUTER JOIN
-- Display the  ename, dept name for all emps 
-- irrespective of their match in depts.
    

SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e LEFT OUTER JOIN depts d
ON e.deptno = d.deptno;


+-------+--------+--------+-------+
| empno | ename  | deptno | dname |
+-------+--------+--------+-------+
|     1 | Amit   |     10 | DEV   |
|     2 | Rahul  |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
|     4 | Nitin  |     50 | NULL  |
|     5 | Sarang |     50 | NULL  |
+-------+--------+--------+-------+
5 rows in set (0.02 sec)
    




--Matching data from both the tables as well as non-matching data From the left table.


--___________________________________________________
-- RIGHT OUTER JOIN
-- Display all the empname and dept name for all the depts
-- irrespective of their match in emp table.
--Matching data from both the tables as well as non-matching data From the Right table.

SELECT e.empno,e.ename,d.deptno,d.dname
FROM emps e RIGHT OUTER JOIN depts d
ON e.deptno = d.deptno;
    
-- OUTER keyword is optional .


+-------+--------+--------+-------+
| empno | ename  | deptno | dname |
+-------+--------+--------+-------+
|     2 | Rahul  |     10 | DEV   |
|     1 | Amit   |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
|  NULL | NULL   |     30 | OPS   |
|  NULL | NULL   |     40 | ACC   |
+-------+--------+--------+-------+
5 rows in set (0.00 sec)


SELECT e.empno,e.ename,d.deptno,d.dname
FROM depts d LEFT OUTER JOIN emps e
ON e.deptno = d.deptno;

+-------+--------+--------+-------+
| empno | ename  | deptno | dname |
+-------+--------+--------+-------+
|     2 | Rahul  |     10 | DEV   |
|     1 | Amit   |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
|  NULL | NULL   |     30 | OPS   |
|  NULL | NULL   |     40 | ACC   |
+-------+--------+--------+-------+
5 rows in set (0.00 sec)


-- ___________________________________________________

-- FULL JOIN

SELECT e.empno,e.ename,d.deptno,d.dname
FROM emps e FULL OUTER JOIN depts d
ON e.deptno = d.deptno;
-- Error : Full outer join is not supported by MySQL.


/*
The above query gives error as mysql does not support FULL JOIN.
To achieve the output of FULL JOIN we can use the SET operators like UNION.
*/
-- UNION ALL (includes duplicates)

(SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e LEFT OUTER JOIN depts d
ON e.deptno = d.deptno)

UNION ALL

(SELECT e.empno,e.ename,d.deptno,d.dname
FROM emps e RIGHT OUTER JOIN depts d
ON e.deptno = d.deptno);


+-------+--------+--------+-------+
| empno | ename  | deptno | dname |
+-------+--------+--------+-------+
|     1 | Amit   |     10 | DEV   |
|     2 | Rahul  |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
|     4 | Nitin  |     50 | NULL  |
|     5 | Sarang |     50 | NULL  |
|     2 | Rahul  |     10 | DEV   |
|     1 | Amit   |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
|  NULL | NULL   |     30 | OPS   |
|  NULL | NULL   |     40 | ACC   |
+-------+--------+--------+-------+
10 rows in set (0.01 sec)



-- UNION (removes duplicates)


(SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e LEFT OUTER JOIN depts d
ON e.deptno = d.deptno)

UNION

(SELECT e.empno,e.ename,d.deptno,d.dname
FROM emps e RIGHT OUTER JOIN depts d
ON e.deptno = d.deptno);


-------+--------+--------+-------+
| empno | ename  | deptno | dname |
+-------+--------+--------+-------+
|     1 | Amit   |     10 | DEV   |
|     2 | Rahul  |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
|     4 | Nitin  |     50 | NULL  |
|     5 | Sarang |     50 | NULL  |
|  NULL | NULL   |     30 | OPS   |
|  NULL | NULL   |     40 | ACC   |
+-------+--------+--------+-------+


--____________________________________
-- SELF JOIN
-- Display the names of all the employees with the names of all their managers.

SELECT E.ename "Emp_Name", M.ename "Mgr_Name"
FROM emps E  INNER JOIN emps M
ON E.mgr  = M.empno;


+----------+----------+
| Emp_Name | Mgr_Name |
+----------+----------+
| Rahul    | Nilesh   |
| Nilesh   | Nitin    |
| Amit     | Nitin    |
| Nitin    | Sarang   |
+----------+----------+
4 rows in set (0.00 sec)


-- To view all the emps irrespective of not having manager :

mysql> SELECT E.ename "Emp_Name", M.ename "Mgr_Name"
    -> FROM emps E  LEFT OUTER JOIN emps M
    -> ON E.mgr  = M.empno;
+----------+----------+
| Emp_Name | Mgr_Name |
+----------+----------+
| Amit     | Nitin    |
| Rahul    | Nilesh   |
| Nilesh   | Nitin    |
| Nitin    | Sarang   |
| Sarang   | NULL     |
+----------+----------+
5 rows in set (0.00 sec)


--_______________________________________
-- understanding equi join and non-equi join.

-- equi join : When we give equality condition for the join
-- ON e.deptno = d.deptno :
-- ON e.mgr = m.empno

-- non - equi join : < , > , != conditon for the joins

-- ______________________________________
-- USING clause

SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e INNER JOIN depts d 
ON e.deptno = d.deptno;


SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e INNER JOIN depts d 
USING(deptno);


/*
USING clause is another syntax we can use as an option for the ON clause.
But it can be used only when the condition is based on equality
and if the column name in both the tables to be joined is SAME.

*/

-- ________________________________________
-- NON-standard way of join syntax for inner join:

SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e INNER JOIN depts d 
ON e.deptno = d.deptno;


-- Works but Not recommended. Non Standard syntax
SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e INNER JOIN depts d 
WHERE e.deptno = d.deptno;
--_________________________________________
-- joining 3 tables
-- Display empname, deptname and dist of all the employees

-- emps, depts, addr

mysql> SELECT E.ename, D.dname, A.dist
    -> FROM emps E INNER JOIN depts D
    -> ON E.deptno = D.deptno
    -> INNER JOIN addr A
    -> ON E.empno = A.empno;
+--------+-------+----------+
| ename  | dname | dist     |
+--------+-------+----------+
| Amit   | DEV   | Kolhapur |
| Rahul  | DEV   | Satara   |
| Nilesh | QA    | Pune     |
+--------+-------+----------+
3 rows in set (0.00 sec)


mysql> SELECT E.ename, D.dname, A.dist
    -> FROM emps E LEFT JOIN depts D
    -> ON E.deptno = D.deptno
    -> INNER JOIN addr A
    -> ON E.empno = A.empno;
+--------+-------+----------+
| ename  | dname | dist     |
+--------+-------+----------+
| Amit   | DEV   | Kolhapur |
| Rahul  | DEV   | Satara   |
| Nilesh | QA    | Pune     |
| Nitin  | NULL  | Satara   |
| Sarang | NULL  | Satara   |
+--------+-------+----------+
5 rows in set (0.00 sec)



--________________________________________
-- Display the emp name and the meeting topic for all the emps.

mysql> SELECT E.ename, M.topic
    -> FROM emps E INNER JOIN emp_meeting EM
    -> ON E.empno = EM.empno
    -> INNER JOIN meeting M
    -> ON EM.meetno = M.meetno;
+--------+-------------+
| ename  | topic       |
+--------+-------------+
| Amit   | App Design  |
| Amit   | Annual meet |
| Rahul  | App Design  |
| Rahul  | Annual meet |
| Nilesh | Annual meet |
| Nilesh | Scheduling  |
| Nitin  | App Design  |
| Nitin  | Annual meet |
| Nitin  | Scheduling  |
| Sarang | Annual meet |
+--------+-------------+
10 rows in set (0.00 sec)






-- _____________________________________
-- Display the emp name, meeting topic and their dist for all emps.
-- emps, meeting, emp_meeting, addr

SELECT E.ename,M.topic,A.dist
FROM emps E INNER JOIN emp_meeting EM
ON E.empno = EM.empno
INNER JOIN meeting M 
ON EM.meetno = M.meetno
INNER JOIN addr A 
ON E.empno =A.empno;


+--------+-------------+----------+
| ename  | topic       | dist     |
+--------+-------------+----------+
| Amit   | Annual meet | Kolhapur |
| Amit   | App Design  | Kolhapur |
| Rahul  | Annual meet | Satara   |
| Rahul  | App Design  | Satara   |
| Nilesh | Scheduling  | Pune     |
| Nilesh | Annual meet | Pune     |
| Nitin  | Scheduling  | Satara   |
| Nitin  | Annual meet | Satara   |
| Nitin  | App Design  | Satara   |
| Sarang | Annual meet | Satara   |
+--------+-------------+----------+
10 rows in set (0.00 sec)


--____________________________________________
-- Display the emp name, meeting topic, dist and their dept name.
-- emps, meeting,emp_meeting,addr,depts

SELECT E.ename, M.topic, A.dist, D.dname
FROM emps E INNER JOIN emp_meeting EM
ON E.empno = EM.empno
INNER JOIN meeting M 
ON EM.meetno = M.meetno
INNER JOIN addr A 
ON E.empno = A.empno
LEFT JOIN depts D 
ON E.deptno = D.deptno;


+--------+-------------+----------+-------+
| ename  | topic       | dist     | dname |
+--------+-------------+----------+-------+
| Amit   | Annual meet | Kolhapur | DEV   |
| Amit   | App Design  | Kolhapur | DEV   |
| Rahul  | Annual meet | Satara   | DEV   |
| Rahul  | App Design  | Satara   | DEV   |
| Nilesh | Scheduling  | Pune     | QA    |
| Nilesh | Annual meet | Pune     | QA    |
| Nitin  | Scheduling  | Satara   | NULL  |
| Nitin  | Annual meet | Satara   | NULL  |
| Nitin  | App Design  | Satara   | NULL  |
| Sarang | Annual meet | Satara   | NULL  |
+--------+-------------+----------+-------+
10 rows in set (0.00 sec)

--__________________________________________
-- Display the dept name and number of emps working in that dept

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
3 rows in set (0.01 sec)


SELECT d.dname,COUNT(e.empno)
FROM emp e INNER JOIN dept d 
ON e.deptno = d.deptno
GROUP BY d.dname;

+------------+----------------+
| dname      | COUNT(e.empno) |
+------------+----------------+
| RESEARCH   |              5 |
| SALES      |              6 |
| ACCOUNTING |              3 |
+------------+----------------+
3 rows in set (0.00 sec)


--_______________________________________
-- Display the dept name and count of emps in 
-- desc order of count
SELECT d.dname, COUNT(e.empno) AS emp_count
FROM emp e INNER JOIN dept d 
ON e.deptno = d.deptno
GROUP BY d.dname
ORDER BY emp_count DESC;

+------------+-----------+
| dname      | emp_count |
+------------+-----------+
| SALES      |         6 |
| RESEARCH   |         5 |
| ACCOUNTING |         3 |
+------------+-----------+
3 rows in set (0.00 sec)

-- _____________________________________
-- Display the dept with highest count of emps 
SELECT d.dname, COUNT(e.empno) emp_count
FROM emp e INNER JOIN dept d 
ON e.deptno = d.deptno 
GROUP BY d.dname
ORDER BY emp_count DESC
LIMIT 1;

+-------+-----------+
| dname | emp_count |
+-------+-----------+
| SALES |         6 |
+-------+-----------+
1 row in set (0.00 sec)

-- ________________________________________
-- Display dept name and clerk count having highest number of clerks
-- Use emp and dept tables

SELECT d.dname , COUNT(e.empno) emp_count
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
WHERE e.job = 'clerk'
GROUP BY d.dname
ORDER BY emp_count DESC
LIMIT 1;

+----------+-----------+
| dname    | emp_count |
+----------+-----------+
| RESEARCH |         2 |
+----------+-----------+
1 row in set (0.00 sec)
--_________________________________
-- Display the emp name and their meeting count in desc order
-- use emps and emp_meeting
-- emps, meetin,emp_meeting

SELECT e.ename, COUNT(em.meetno) meet_count
FROM emps E INNER JOIN emp_meeting EM
ON E.empno = EM.empno 
GROUP BY e.ename
ORDER BY meet_count DESC;

+--------+------------+
| ename  | meet_count |
+--------+------------+
| Nitin  |          3 |
| Nilesh |          2 |
| Amit   |          2 |
| Rahul  |          2 |
| Sarang |          1 |
+--------+------------+
5 rows in set (0.00 sec)

/* Final Sequence :
SELECT col1,col2..
FROM table 1 JOIN tb2
ON join_condition
JOIN tbl 3
ON Join_condition
JOIN tbl 4
ON Join_condition
WHERE condition_for_row
GROUP BY col
HAVING condition_for_group
ORDER BY col ASC/DESC
LIMIT m,n;

*/  



--_____________________INDEXES_______________________________
-- Indexes :
SELECT * FROM emp
WHERE deptno = 30;

EXPLAIN FORMAT = JSON
SELECT * FROM emp
WHERE deptno = 30;

-- "query_cost": "1.65"
--  "access_type": "ALL"


-- Simple Index :
-- syntax : CREATE INDEX index_name ON tbl_name(col);

CREATE INDEX idx_emp_deptno  ON emp(deptno);


EXPLAIN FORMAT = JSON
SELECT * FROM emp
WHERE deptno = 30;
--  "query_cost": "1.10"
--  "access_type": "ref",




-- Create an index on the emps table on sal col in Desc order.
CREATE INDEX idx_emp_sal ON emp(sal DESC);

-- check the indexes created.
SHOW INDEXES FROM emp;

/*
When we create indexes on the columns, Our SELECT query gets faster, but the DML
may get slower.
*/
--_____________________________________
--unique Index :
-- Create a unique index on empno col of emps table.
CREATE UNIQUE INDEX idx_uni_empno ON emps(empno);

/*
The UNIQUE INDEX enables faster searching for the empno column,
but, it also ensures that unique data is inserted for that column.
*/


-- check the index on the table. 
DESC emp;
/*
UNI in the key column means UNIQUE values allowed.
MUL in the key column means Multiple duplicates allowed.
*/


--______________________________________________________________
-- Composite Index : Index created on the combination of columns

-- find all emps from emp table working in dept 20 as clerk.
EXPLAIN FORMAT = JSON
SELECT * FROM emp
WHERE deptno = 30
AND
job = 'clerk';

-- "query_cost": "1.10"
--  "access_type": "ref"




-- Create an index on deptno and job.
CREATE INDEX idx_dept_job ON emp(deptno,job);


-- check the query cost.

-- "query_cost": "0.35"



-- check the indexes created.
SHOW INDEXES FROM emp;

--_______________________________
-- Composite Unique Index :
-- Create a student table
-- roll_no : int
-- std : int
-- name : varchar(20)
-- marks : decimal(5,2)


/*
std     roll_no     Name        marks
________________________________________
1       1           A           90
1       2           B           91
1       3           C           98
2       1           D           80
2       2           E           85
3       1           F           90
3       2           G           92

*/

CREATE INDEX idx_std_roll ON students(std,roll_no);

--insert some rows




-- Create composite unique on roll_no + std


-- insert some duplicate rows


-- Lab Work :
-- check the query cost on join
EXPLAIN FORMAT = JSON
SELECT e.empno,e.ename,d.dname
FROM emps e LEFT JOIN depts d 
ON e.deptno = d.deptno;

-- "query_cost": "3.00"
-- "access_type": "ALL",


-- Create an index on deptno of emp and deptno of dept separately.
CREATE INDEX idx_emp_Deptno ON emps(deptno);
CREATE INDEX idx_dept_deptno ON depts(deptno);



-- Check the query cost of the above query again,

-- "query_cost": "2.50"

-- drop the index.

DROP INDEX idx_uni_empno ON emps;

-- OR
ALTER TABLE emps DROP INDEX idx_uni_empno;

-- If the table is dropped, its corresponding indexes also get dropped internally.




