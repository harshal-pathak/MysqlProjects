/* Q.1 Write query to select payment_id, customer_id, staff_id, rental_id, amount from table payment 
(schema - sakila) which satisfies both below mentioned conditions.
Range for customer_id 10,20,30,40,50,60,70,0,90,100
staff_id is 2 */
USE sakila;
SELECT * FROM payment;
SELECT payment_id, customer_id, staff_id, rental_id, amount FROM payment
WHERE customer_id IN(10,20,30,40,50,60,70,80,90,100) AND staff_id IN(2);

-- Q.2 Write query to display record of table film (schema - sakila) ordered by rating in descending order.
USE sakila;
SELECT * FROM film;
SELECT * FROM film ORDER BY rating DESC;

/* Q.3  Write query to display payment_id, amount and updated_amount from table payment (schema - sakila) 
which supports result set with below mentioned criteria.
amount is greater than 5.0
updated_amount is double of amount and rounded off */
USE sakila;
SELECT payment_id, amount FROM payment;
SELECT payment_id, amount,round(amount*2,0) updated_amount FROM payment WHERE amount > 5.0;


/* Q.4 Write query to display below mentioned values from table payment for each customer (customer_id) 
(schema - sakila) 
customer_id 
Total sum of the payment
Average of the payment
Standard deviation of the payment
Variance of the payment  */
USE sakila;
SELECT * FROM payment;
SELECT customer_id, SUM(amount) Sum_of_payment, ROUND(AVG(amount),2) Avg_of_payment, ROUND(STDDEV(amount),3) Std_deviation_of_payment, ROUND(VARIANCE(amount),3) Variance_payment FROM payment GROUP BY customer_id;

-- Q.5 Write query to display city_id, city, country_id from table city for country name starting with A and B (schema - sakila)
USE sakila;
SELECT * FROM city;
SELECT city_id, city, country_id FROM city WHERE city LIKE 'a%' OR city LIKE 'b%' ;

/* Q.6 What is the difference between ANY and ALL keyword with respect to subquery in SQL?
ALL – Comparison with every value ANY – Comparison with atleast one value
ALL – Comparison with atleast one value ANY – Comparison with every value
ALL – Comparison with every value ANY – Comparison with atleast two value
ALL – Comparison with atleast two value ANY – Comparison with atleast one value */
-- ANSWER :-  ALL – Comparison with atleast two value ANY – Comparison with atleast one value
