-- Q.3 Run describe command for table language and rental through python code
USE sakila;
DESC language;
DESC rental;

/* Q.4 Write code to display result set from three tables store, inventory and film_text using inner join through python.
Output in MySQL Workbench is shown in figure 1 */
USE sakila;
SELECT s.store_id, s.manager_staff_id,s.address_id,i.inventory_id,i.film_id,f.title
FROM store s INNER JOIN inventory i ON s.store_id = i.store_id INNER JOIN 
film_text f ON f.film_id = i.film_id ORDER BY title;