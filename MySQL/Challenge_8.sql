-- Q.1 Write query to create view active_customer with all details of customer belonging to store id 1 and with active status. (schema – sakila, table - customer ). 
USE sakila;
SELECT * FROM customer;
CREATE VIEW active_customer AS SELECT * FROM customer WHERE store_id = 1 AND active = 1;
SELECT * FROM active_customer;

/* Q.2 Write query to create view customer_detail that list the customer detail including city name and address also. 
(schema – sakila)
(Hint: Result set stored in view customer_detail is shown in below picture) */
USE sakila;
SELECT * FROM customer;
CREATE VIEW customer_detail AS SELECT c.customer_id, c.first_name, c.last_name, c.email, a.address, ci.city
FROM customer c INNER JOIN address a ON c.address_id = a.address_id 
INNER JOIN city ci ON ci.city_id = a.city_id;
SELECT * FROM customer_detail ORDER BY city;

-- Q.3 Create three users Alpha, Beta and Gama in MySQL Wokbench and assign below mentioned roles\privileges to these users.
