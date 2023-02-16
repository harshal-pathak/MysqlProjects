USE sakila;
SELECT * FROM film;
SELECT COUNT(title), rating FROM film GROUP BY rating;
SELECT rating, COUNT(title) OVER() FROM film;
SELECT rating, COUNT(title) OVER(ORDER BY rating) FROM film ;
SELECT rating, COUNT(title) OVER(PARTITION BY rating) FROM film ;
SELECT film_id, title, rating, COUNT(rating) OVER() FROM film;
SELECT film_id, title, rating, COUNT(rating) OVER(PARTITION BY rating ORDER BY rating DESC) FROM film;
SELECT film_id, title, rental_rate, SUM(rental_rate) OVER() FROM film;
SELECT SUM(rental_rate) FROM film;
SELECT film_id, title, rating, SUM(rental_rate) OVER() FROM film;
SELECT film_id, title, rating, SUM(rental_rate) OVER(PARTITION BY rating) FROM film;
/* Write a SQL query to find the film_id, title, rating, total number of length for each rating, 
average length for each rating, minimum length and maximum length from the film table. */
SELECT film_id, title, rating ,SUM(length) OVER (PARTITION BY rating) ,AVG(length) OVER (PARTITION BY rating), MIN(length) OVER (PARTITION BY rating), MAX(length) OVER (PARTITION BY rating) FROM film;
SELECT film_id, title, rating ,SUM(length) OVER () ,AVG(length) OVER (), MIN(length) OVER (), MAX(length) OVER () FROM film;
/* Write a SQL query to display film_id, title, special feature and total replacement cost for each special feature from the film table. */
SELECT * FROM film;
SELECT film_id, title, special_features, SUM(replacement_cost) OVER(PARTITION BY special_features) SUM_replacemetn_cost FROM film;
SELECT title, ROW_NUMBER() OVER() FROM film;
SELECT rating, ROW_NUMBER() OVER(PARTITION BY rating) FROM film;
SELECT title, RANK() OVER() FROM film;
SELECT RANK() OVER(ORDER BY title), title FROM film;

-- Write a SQL query to display the rank based on length for each rating from the film table.
SELECT * FROM film;
SELECT RANK() OVER(),length OVER(PARTITION BY rating) FROM film;
-- Write a SQL query to display rank, length and the rank based on length for each rating from film table.
SELECT rating,length, RANK() OVER(PARTITION BY rating ORDER BY length) FROM film;
SELECT rating,length, DENSE_RANK() OVER(PARTITION BY rating ORDER BY length) FROM film;
-- Write a SQL query to display rating, total rental_rate, previous total rental rate from the film table.
SELECT film_id,title, rental_rate, LAG(rental_rate,2) OVER() FROM film;
SELECT * FROM film;
SELECT film_id, title, rating, SUM(rental_rate) OVER(PARTITION BY rating), LAG((rental_rate),1) OVER(PARTITION BY rating) FROM film;
SELECT * FROM city CROSS JOIN country;
SELECT COUNT(*) FROM city;
SELECT COUNT(*) FROM country;
SELECT 600*109;
USE hr;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM employees CROSS JOIN departments;
SELECT employee_id, first_name, department_name FROM employees  CROSS JOIN departments ;
USE sakila;
DESC film;
DESC film_actor;
SELECT * FROM film f INNER JOIN film_actor f_a ON f.film_id = f_a.film_id;
SELECT COUNT(*) FROM film;
SELECT COUNT(*) FROM film_actor;
SELECT f.film_id,f.title, f_a.actor_id FROM film f JOIN film_actor f_a ON f.film_id = f_a.film_id;
-- Write a SQL query to display customer id, first name, city from customer and city table using left join.
SELECT * FROM customer;
SELECT * FROM address;
SELECT * FROM city;
SELECT c.customer_id, c.first_name,a.address  FROM customer c LEFT JOIN address a ON c.address_id = a.address_id;
-- Write a SQL query to display customer id, first name, address, city from customer, address nd city table using left join.
SELECT c.customer_id, c.first_name, a.address, ci.city FROM customer c LEFT JOIN address a ON c.address_id = a.address_id LEFT JOIN city ci ON ci.city_id = a.city_id; 
-- Write a SQL query to display customer id, first name, city from customer and city table using right join.
SELECT c.customer_id, c.first_name,a.address FROM customer c RIGHT JOIN address a On c.address_id = a.address_id;
-- Write a SQL query to display customer id, first name, address, city from customer, address nd city table using right join
SELECT c.customer_id, c.first_name, a.address, ci.city FROM customer c RIGHT JOIN address a ON c.address_id = a.address_id RIGHT JOIN city ci ON ci.city_id = a.city_id;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM city, country WHERE city.country_id = country.country_id;
SELECT c.customer_id, c.first_name,a.address FROM customer c RIGHT JOIN address a On c.address_id = a.address_id;
DELETE customer, address FROM customer INNER JOIN address ON customer.address_id = address.address_id WHERE customer.customer_id =1;
UPDATE customer INNER JOIN address ON customer.address_id = address.address_id SET first_name = 'Harshal' WHERE customer.customer_id =2;
SELECT * FROM customer;
drop table if exists meal; 
create table meal (meal text);
drop table if exists drink; 
create table drink(drink text);
insert into meal values('Chapati'),('Oats');
insert into drink values('Butter Milk'),('Juice');
SELECT * FROM meal;
SELECT * FROM drink;
select * from meal cross join drink;
