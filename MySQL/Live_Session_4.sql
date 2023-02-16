SELECT 'Apple','Orage' UNION SELECT 'Cat','Dog';
SELECT 'Apple','Orage' UNION SELECT 'Cat','Dog' UNION SELECT'Water','Milk';
USE sakila;
/* Write a SQL query to display customer id , first name for the customer where first name starts with M and display customer id , 
first name for those customers who have their name starting from J. */
SELECT * FROM customer;
SELECT customer_id, first_name FROM customer  WHERE first_name LIKE 'M%' UNION SELECT customer_id, first_name FROM customer  WHERE first_name LIKE 'J%';
/* Write a SQL query to display all the information for country id 8 from city table and display all the information for country id 8 from country table. */
SELECT * FROM city WHERE country_id = 8 UNION  SELECT * FROM country WHERE country_id =8; 
-- Write a SQL query to display all the information from city table where country is INDIA.
SELECT * FROM city WHERE country_id = (SELECT country_id FROM country WHERE country='India');
SELECT country_id FROM country ;
SELECT * FROM city WHERE country_id = (SELECT country_id FROM country ); -- More than one row (subquery)
-- Write a SQL query to display all the information from the city table where country id is less than the country id 5.
SELECT * FROM city WHERE country_id <(SELECT country_id FROM city WHERE country_id = 5) ;
-- Write a SQL query to display all the information from the city table below the country id where country name is Anguilla.
SELECT * FROM city WHERE country_id < (SELECT country_id FROM country WHERE country='Anguilla');
SELECT country_id FROM country WHERE country='Anguilla';
SELECT * FROM city WHERE country_id != (SELECT country_id FROM country WHERE country='India');
SELECT (SELECT 1);
USE sakila;
SELECT * FROM (SELECT * FROM country) c ;
SELECT country FROM (SELECT * FROM country) c;
-- Write a SQL query to extract address from the address table.
SELECT address FROM (SELECT * FROM address) a;
-- Write a SQL query to find the minimum, maximum, and average value from the extracted rating and number of films for each rating from the film table.
SELECT rating,COUNT(title) FROM film GROUP BY rating;
SELECT * (SELECT rating,COUNT(title) FROM film GROUP BY rating);
SELECT rating, min(count_title ), max(count_title ) FROM (SELECT rating,COUNT(title) count_title FROM film GROUP BY rating) ratings;
SELECT rating,min(count_title ), max(count_title ) FROM (SELECT rating,COUNT(title) count_title FROM film GROUP BY rating) ratings UNION
SELECT min(count_title ), max(count_title ) FROM (SELECT rating,COUNT(title) count_title FROM film GROUP BY rating) ratings;
-- Write a query to display all the movies from the film table that are in english yet have titles that start with the letter K.
SELECT language_id, name FROM language WHERE name='English';
-- Write a query to display all the movies from the film table that are in english
SELECT title FROM film WHERE language_id IN (SELECT language_id FROM language WHERE name='English');
SELECT title FROM film WHERE language_id IN (SELECT language_id FROM language WHERE name='English') AND title LIKE'K%';
-- Write a query to display the titles of movies starting with the letters K and Q whose language is English.
SELECT title FROM film WHERE language_id IN (SELECT language_id FROM language WHERE name='English') AND title LIKE'K%' OR title LIKE 'Q%';
/* CASE
WHEN rating = 'PG'
THEN 'DO NOT WATCH'
ELSE rating
END */
SELECT rating,CASE
WHEN rating = 'PG'
THEN 'DO NOT WATCH'
ELSE rating
END Review FROM film;
SELECT rating,CASE
WHEN rating = 'PG'
THEN 'DO NOT WATCH'
WHEN rating = 'G'
THEN 'Kids can Watch'
WHEN rating = 'NC-17'
THEN 'Watch'
ELSE rating
END Review FROM film;
-- Write query to calculate no of films and each rating
SELECT rating, COUNT(title) Count_title FROM film GROUP BY rating;
SELECT 
CASE WHEN rating = 'PG' THEN COUNT(title) ELSE '' END PG, 
CASE WHEN rating = 'G' THEN COUNT(title) END G,
CASE WHEN rating = 'NC-17' THEN COUNT(title)  END NC17,
CASE WHEN rating = 'PG-13' THEN COUNT(title) END PG_13,
CASE WHEN rating = 'R' THEN COUNT(title)  END R
FROM film GROUP BY rating;
SELECT* FROM payment;
SELECT * FROM customer;
Use employees;
SELECT EXISTS (SELECT 1 FROM titles WHERE title = 'Senior Engineer') Result;
SELECT EXISTS (SELECT 1 FROM titles WHERE title = 'Executive') Result;
SELECT e.emp_no,e.first_name,e.last_name,
CASE
WHEN EXISTS
(SELECT 1 FROM titles t WHERE t.title = 'Senior Engineer' AND t.emp_no = e.emp_no)
THEN 'Report to office'
Else 'WFH'
END Decision FROM employees e;
SELECT 
SUM(CASE WHEN YEAR(hire_date) = 1986 THEN 1 ELSE 0 END) Year_1986,  
SUM(CASE WHEN YEAR(hire_date) = 1987 THEN 1 ELSE 0 END) Year_1987,  
SUM(CASE WHEN YEAR(hire_date) = 1988 THEN 1 ELSE 0 END) Year_1988,  
SUM(CASE WHEN YEAR(hire_date) = 1989 THEN 1 ELSE 0 END) Year_1989,  
SUM(CASE WHEN YEAR(hire_date) = 1990 THEN 1 ELSE 0 END) Year_1990
FROM employees WHERE hire_date > '1985-12-31' AND hire_date < '1991-01-01';

 




