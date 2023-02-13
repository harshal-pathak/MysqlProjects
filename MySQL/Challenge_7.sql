-- Q.1 Write query to make summary of table payment 
-- (calculate Total amount, average amount, minimum amount, maximum amount, variance of amount). 
-- Result set should give output as shown in figure 1 (schema - sakila). 
USE sakila;
SELECT * FROM payment;
SELECT 'Parameter', 'Value' FROM payment
UNION SELECT 'Total Amount', SUM(amount) FROM payment
UNION SELECT 'Average Amount', AVG(amount) FROM payment
UNION SELECT 'Minimum Amount', MIN(amount) FROM payment
UNION SELECT 'Maximum Amount', MAX(amount) FROM payment
UNION SELECT 'Variance Amount', VARIANCE(amount) FROM payment;

/* Q.2 Write query to calculate Total amount, average amount, 
minimum amount of amount from table payment for customer group using window function. 
(schema - sakila). 
Output for result set is shown in figure 2. */
USE sakila;
SELECT payment_id, customer_id, staff_id, SUM(amount) OVER(PARTITION BY customer_id) Total_amount,
AVG(amount) OVER(PARTITION BY customer_id) , MIN(amount) OVER(PARTITION BY customer_id) FROM payment;

-- Q.4 Write column name/s for below written tables in which null values are allowed (schema – sakila).
DESC film_category;
DESC city;
DESC Address; -- address2 	varchar(50)
DESC store;
DESC film_actor;

-- Q.4  Write query to calculate the incline/decline for number of payments made on each date.
--  (schema – sakila, table – payment). Output for result set is shown in figure 3.
USE sakila;
SELECT * FROM payment;
SELECT payment_date, COUNT(payment_date) Currentcount, LAG(COUNT(payment_date),1) OVER(ORDER BY payment_date) Previouscount,
(COUNT(payment_date) - LAG(COUNT(payment_date),1) OVER(ORDER BY payment_date)) Countdifference
 FROM payment GROUP BY DATE(payment_date) ORDER BY payment_date;