-- Challenge_4
-- Q.1 Write query to select film_id, title, length of title, description (to be displayed in upper case) from table film (schema - sakila).
USE sakila;
DESC film;
SELECT * FROM film;
SELECT film_id,title,LENGTH(title) Length,UPPER(description) Upper_case FROM film;

-- Q.2 Write query to display result set shown in figure 1 from table film (schema - sakila).
USE sakila;
SELECT * FROM film;
SELECT REPEAT(title,3) title FROM film;

-- Q.3 Write query to display result set shown in figure 2 from table film (schema - sakila).
USE sakila;
SELECT * FROM film;
SELECT description, length(description) FROM film;
SELECT film_id, title, LEFT(description, 13) Description FROM film;

-- Q.4 Write query to display result set shown in figure 3 from table film (schema - sakila).
USE sakila;
SELECT * FROM film;
SELECT title,RPAD(REVERSE(title),32,REVERSE(title)) Codeword  FROM film;

-- Q.5 Write query to display number of days since the last update in table actor (schema - sakila).
USE sakila;
SELECT * FROM actor;
SELECT * , DATEDIFF(CURRENT_DATE, last_update) No_of_days_Last_Updated FROM actor;

-- Q.6 Write query to display result set shown in figure 4 from table customer (schema - sakila).
USE sakila;
SELECT * FROM customer;
SELECT create_date, DATE(create_date) Date, TIME(create_date) Time FROM customer;