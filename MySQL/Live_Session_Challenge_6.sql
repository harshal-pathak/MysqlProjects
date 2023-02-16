CREATE DATABASE company_details;
DESC department_details;
DESC employee_details;
DROP TABLE IF EXISTS bankaccount;
CREATE TABLE IF NOT EXISTS bankaccount(
a_id int NOT NULL,
firstname varchar(50) NOT NULL,
l_name varchar(50) NOT NULL,
ssn char(10) NOT NULL,
a_holderid int NOT NULL,
balance decimal(20,4) DEFAULT '0.0000',
PRIMARY KEY (a_id));
INSERT INTO bankaccount (a_id , a_holderid , balance , firstname , l_name , ssn) VALUES
(1, 100, 132.1020, 'Tom', 'Cane', '098765432'),
(2, 300, 4435.2030, 'Kim', 'Karry', '087654321'),
(3, 120, 2345223.6600, 'Jim', 'Andy', '123456780'),
(4, 90, 98763.2300, 'Jessie', 'Thomson', '765432109'),
(5, 110, 34221.1000, 'Palak', 'Mehra', '654321890'),
(6, 80, 7634.8000, 'Max', 'Jerrard', '456789012'),
(7, 10, 876964.7000, 'Peter', 'Koshnov', '512345670'),
(8, 110, 299876.6000, 'Max', 'Irodov', '120088551'),
(9, 100, 7659809.5300, 'Petro', 'Jenkins Jr', '123456789'),
(10, 200, 111.1200, 'Jeff', 'Marsh', '765432189' );
SELECT * FROM bankaccount;

-- Create an index idx_salary on salary in the employee_details table. and fetch the salary for the employee who's name is starting with 'J'.
SELECT * FROM employee_details;
DESC employee_details;
CREATE INDEX idx_salary ON employee_details(FIRST_NAME);
ALTER TABLE employee_details MODIFY FIRST_NAME VARCHAR(50);
SELECT * FROM employee_details WHERE FIRST_NAME LIKE 'J%';

-- Create a view "details" that contains the columns employee_id, first_name, last_name and the salary from the table "employee_details".
SELECT * FROM employee_details;
CREATE VIEW details AS SELECT employee_id, first_name, last_name, salary FROM employee_details;
SELECT * FROM details;

-- Update the view "details" such that it contains the records from the columns employee_id, first_name, last_name, salary, hire_date and job_id
-- -- where job_id is ‘FI_MGR’.
ALTER VIEW details AS SELECT employee_id, first_name, last_name, salary, hire_date, job_id FROM employee_details;
SELECT * FROM details;
ALTER VIEW details AS SELECT employee_id, first_name, last_name, salary, hire_date, job_id FROM employee_details WHERE job_id='FI_MGR';
SELECT * FROM details;

-- Create a view "rangeofsalary" such that it contains the records from the columns employee_id, first_name, last_name, job_id and salary from the table "employee_details"
-- -- where the salary is in the range (12000 to 54000).
SELECT * FROM employee_details WHERE salary BETWEEN 12000 AND 54000;
CREATE VIEW rangeofsalary AS SELECT employee_id, first_name, last_name, job_id, salary FROM employee_details WHERE salary BETWEEN 12000 AND 54000;
SELECT * FROM rangeofsalary;

-- Drop multiple existing views "details", "rangeofsalary".
DROP VIEW IF EXISTS details, rangeofsalary ;

-- Create a view "employee_department" that contains the common records from the tables "employee_details" and "department_table".
CREATE VIEW employee_department AS SELECT e.employee_id, e.department_id, e.manager_id FROM employee_details e INNER JOIN department_details d WHERE e.employee_id = d.employee_id;
SELECT * FROM employee_department;

-- Write a tansactional query that transfers 2000 dollars from Max's account to Tom's account and save the change.
SELECT * FROM bankaccount;
UPDATE bankaccount b1 JOIN bankaccount b2 ON b1.firstname = 'Tom' AND b2.firstname = 'Max' SET b1.balance = b1.balance+2000 , b2.balance = b2.balance - 2000;
SELECT * FROM bankaccount;

--  Suppose while writing the above query you update i.e. transfer 2000 dollars to Peter's account instead of Tom's account.
UPDATE bankaccount b1 JOIN bankaccount b2 ON b1.firstname = 'Peter' AND b2.firstname = 'Tom' SET b1.balance = b1.balance + 2000 , b2.balance = b2.balance - 2000;
SELECT * FROM bankaccount;


