/*
AGENDA :
PSM : PERSISTANT STORED MODULE :
    Procedures
    Functions
    Triggers 
*/

--____________________________________________________
-- Stored Procedures :
-- Create a simple stored procedure to display hello world

PSM01.sql


--_____________________________________________________
-- Create a result table with id - INT, msg - VARCHAR(90)
CREATE TABLE result (id INT, msg VARCHAR(90));


-- Create a procedure to insert a msg into the result table, 
-- accept a name as a parameter.
 -- msg : Hello 'name' (passed as a parameter)

PSM02.sql

 --________________________________________________
 -- Display area and circumference of circle.
-- consider radius as 7.

PSM03.sql

--__________________________________________________
--find emp name with max and min sal and store the names into
-- result table with their sal values.

PSM04.sql

--___________________________________________
-- Perform addition of even numbers in a given range 
--(passed as parameter)
-- display the result on the CLI.

PSM05.sql

--________________________________________________
/*
Accept a number as argument and check if its prime or not.
Insert the result into the result table.
*/

PSM06.sql


--_________________________________________________________
-- Create a procedure to accept a number and print its table
-- using the repeat loop
-- insert the table into the result table.

PSM07.sql

--________________________________________________
-- parameters :
--IN : used to take only input inside the procedure.
-- by DEFAULT every parameter is IN parameter.

-- OUT : used to return the result from the procedure.
-- To define a parameter as "out", we use the "OUT" keyword
-- before that parameter.

-- INOUT : used to take the input into the procedure
-- and the same parameter variable is used to take the output
-- from the procedure
--____________________________________________________
-- Create a procedure to accept a number as parameter 
-- and return the square of that number 
-- from another parameter from the procedure. 

PSM08.sql


--___________________________________________________
-- create a procedure to accept a number and return the square
-- from the same parameter.

PSM09.sql

--___________________________________________________

-- functions :
/*
By default any user cannot compile the functions. 
It requires SUPER privileges from the root.
1)  Exit from current user.
2) Login through ROOT user.
3) change the settings of the global variable as below
SET GLOBAL log_bin_trust_function_creators = 1;

4) SELECT  @@log_bin_trust_function_creators;
make sure it gives the value 1.

5) Login again through sunbeam user and compile the function.

*/



/*
Functions
 MySQL Function Types
 DETERMINISTIC
    If input is same, output will remain same ALWAYS.
    Internally MySQL cache input values and corresponding output.
    If same input is given again, directly output may return 
    to speedup the execution.
 NOT DETERMINISTIC
    Even if input is same, output may differ.
    Output also depend on current date-time or state of table 
    or database settings.
    These functions cannot be speedup.
*/

-- write a function to add two decimal values.
-- if any input is null, consider it as 0.

PSM10.sql


--___________________________________________________________
-- display empno,ename,hire,exp in terms of months.
SELECT empno,ename,hire,TIMESTAMPDIFF(MONTH,hire,NOW()) AS exp_in_months
FROM emp;


-- Write a function to display the experience of emps
-- in months.

PSM11.sql

--______________________________________________
-- triggers
-- create an accounts table 
--id-int, acc_type-char(20), balance -decimal(9,2)
-- insert few rows.
/*
INSERT INTO accounts VALUES(1,'savings',10000);
INSERT INTO accounts VALUES(2,'savings',5000);
INSERT INTO accounts VALUES(3,'Current',2500);
INSERT INTO accounts VALUES(4,'savings',1200);
*/
-- Create a transactions table
-- acc_id  INT,
 -- tran_type  char(20), 
-- time  datetime, 
-- amount  decimal(9,2)

CREATE TABLE transactions(acc_id INT,tran_type CHAR(20),time datetime, 
amount DECIMAL(9,2));

-- When the transaction is done in transactions table, 
--automatically accounts table balance must be modified.

trig01.sql


/*
When we perform the update operation,
we can access the old and new values of the updated row 
with the NEW and OLD keywords inside the trigger.

When we perform the delete operation,
We can access only old value of the deleted row
with the OLD keyword inside the trigger.

When we perform the insert operation,
We can access only the new values of the inserted row
with the NEW keyword inside the trigger.
*/

--____________________________________________________________
-- Lab Assignment :
-- Create a trigger for update on emp table.
-- When the sal of emp is updated, 
--insert the old and new sal into result table
-- id--> empno 
-- msg --> old_sal updated to new_sal
-- msg --> 1500 updated to 1900
/*
 The trigger is fired for the update on any column in the emp table.
 but the insert in the result table should be done only if the sal is updated.
 for that, inside the trigger check if old sal and new sal
 are not same then only insert into result table.
*/

--_______________________________________________________



