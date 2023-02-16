USE alumni;
CREATE DATABASE test1;
-- USEING TEST AS EXAMPLE
# USEING TEST AS EXAMPLE
/* USEING TEST AS EXAMPLE
USEING TEST AS EXAMPLE */
DROP DATABASE test;
DROP SCHEMA test1;
SHOW DATABASES;
CREATE TABLE test1 (
id int ,
name text,
mark int default(0));
INSERT INTO test1 (id,name) VALUES  (1,'ABC');
SELECT * FROM test1;
DROP TABLE IF EXISTS test1 ;
CREATE TABLE test1 (
id int primary key,
name text,
marks int not null check(marks in (0,50,100)));
DESC test1;
INSERT INTO test1 (id,name,marks) VALUES
(1,'ABC',50),
(2,'DEF',100),
(3,'GHI',0);
SELECT * FROM test1;
CREATE TABLE test2 (
id int ,
name text,
marks int not null check(marks in (0,50,100)),
primary key (id),
foreign key (id) references test1(id));
CREATE TABLE test3 (
id int ,
name text,
marks int not null check(marks in (0,50,100)),
primary key (id),
constraint fkid foreign key (id) references test1(id));
CREATE TABLE Course (
    cno INT PRIMARY KEY,
    cname VARCHAR(20)
);
INSERT INTO Course(cno, cname) 
 VALUES(101,'c'),
       (102,'c++'),
       (103,'DBMS');
CREATE TABLE Enroll (
    cno INT,
    PRIMARY KEY(cno)
    ,FOREIGN KEY(cno) 
        REFERENCES Course(cno)
        ON DELETE RESTRICT
);
DELETE FROM course
WHERE cname="DBMS";
SELECT * FROM Enroll;
DELETE FROM Enroll
WHERE cno = 102;
SELECT 'Harshal'; 
USE sakila;
SELECT * FROM customer;
SELECT * FROM customer WHERE customer_id < 10 and active=1;
SELECT * FROM customer WHERE first_name ='SUSAN';
SELECT * FROM customer WHERE first_name = 'linda';
SELECT * FROM customer WHERE customer_id = 1;
DELETE FROM customer WHERE customer_id = 1;
UPDATE customer SET first_name = 'Harshal' WHERE customer_id =1;
ALTER TABLE customer ADD Location VARCHAR(50) AFTER email;
UPDATE customer SET Location = 'Delhi';
ALTER TABLE customer MODIFY Location TEXT;
DESC customer;
ALTER TABLE customer DROP COLUMN city;
ALTER TABLE customer CHANGE COLUMN Location city TEXT;
SELECT * FROM customer;
SELECT DISTINCT store_id No_of_store FROM customer;
SELECT DISTINCT address_id FROM customer;
SELECT * FROM customer WHERE first_name NOT LIKE 'G%';
SELECT 35*45 MUL;
CREATE TABLE num (i int);
INSERT INTO num (i) VALUES (1),(2),(3),(4),(5),(6) ;
SELECT 5, 'x' , i, '=' , 5*i prod FROM num;
SELECT 'a' , 'b', 'c';
-- SELECT * INTO test5 FROM city query for copying 
SELECT COUNT(DISTINCT first_name) FROM customer; 
USE hr;
SELECT * FROM countries;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM job_history;
SELECT * FROM jobs;
SELECT * FROM locations;
SELECT * FROM regions;