/* 1. Write query to select all record from table customer (schema - sakila).
2. Write query to select record from table customer for fields customer_id (Alias - ID),
 first_name (FName), last_name (LName), email (EmailID) (schema - sakila).*/
USE sakila;
SELECT * FROM customer;
SELECT customer_id ID,first_name FName,last_name LName,email EmailID FROM customer;
-- 3. Write query to display film title starting with alphabet ‘A’ and ending with alphabet ‘r’ from table film (schema - sakila)
USE sakila;
SELECT * FROM film;
SELECT * FROM film WHERE title LIKE 'A%r';
-- 4. Write query to display first 100 records from table customer (schema - sakila).
USE sakila;
SELECT * FROM customer;
SELECT * FROM customer LIMIT 100;
-- 5. Write query to display payment_id, amount, rounded off value of amount and square root of amount from table payment (schema - sakila) in single statement.
USE sakila;
SELECT * FROM payment;
SELECT payment_id ,amount ,ROUND( amount , 1 ) Rounded_value, SQRT( amount ) Squareroot_val FROM payment;
-- 6. Create backup for schema – sakila.
-- Creating backup in file sakila1.
USE sakila1;
SELECT * FROM payment;
-- Backup file created sakila1arch.sql in bin folder<MYSQL<C Drive.