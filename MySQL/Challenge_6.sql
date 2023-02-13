-- Q.1 Write query to display result set shown in figure 1 using inner join (schema - sakila) 
USE sakila;
SELECT * FROM city;
SELECT * FROM country;
SELECT city.city_id, city.city, country.country_id, country.country FROM city
INNER JOIN country ON city.country_id = country.country_id;

-- Q.2 Write query to join tables film, film_category and category using inner join. Result set should be like shown in figure 2 (schema - sakila) 
USE sakila;
SELECT * FROM film;
SELECT * FROM category;
SELECT * FROM film_category;
SELECT f1.film_id, f1.title, f1.description, f2.category_id, c.name FROM film f1
INNER JOIN film_category f2 ON f1.film_id = f2.film_id INNER JOIN category c ON
c.category_id = f2.category_id;

-- Q.3 Write query to join tables film, inventory and film_text using left join. Result set should be like shown in figure 3 (schema - sakila)
USE sakila;
SELECT * FROM film;
SELECT * FROM inventory;
SELECT * FROM film_text;
SELECT f1.film_id, f1.title, f1.description, i.inventory_id, f2.description FROM film f1
LEFT JOIN  film_text f2 ON f1.film_id = f2.film_id LEFT JOIN inventory i  ON
i.film_id = f2.film_id;

-- Q.4 Write query to display the staff_id, first_name, last_name, payment amount, payment_date, rental_date and return_date from tables staff, payment and rental (schema - sakila) 
USE sakila;
SELECT * FROM staff;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT s.staff_id, s.first_name, s.last_name, p.amount, p.payment_date, r.rental_date, r.return_date
FROM staff s INNER JOIN payment p ON s.staff_id = p.staff_id INNER JOIN 
rental r ON r.staff_id = p.staff_id;