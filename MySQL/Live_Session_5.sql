USE sakila;
SHOW INDEX FROM category;
SHOW INDEX FROM film;
CREATE INDEX rent_rate ON film(rental_rate);
SHOW INDEX FROM film;
SELECT * FROM film WHERE rental_rate < 5;
DROP INDEX rent_rate ON film;
SELECT COUNT(*) FROM film;
DESC meal;
SELECT * FROM meal;
INSERT INTO meal (meal) VALUES 
('BrownRice');
CREATE INDEX meal_1 ON meal(meal);
CREATE DATABASE test;
USE test;
CREATE TABLE `category` (
  `category_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;


INSERT INTO `category` VALUES (1,'Action','2006-02-14 23:16:27'),(2,'Animation','2006-02-14 23:16:27'),(3,'Children','2006-02-14 23:16:27'),(4,'Classics','2006-02-14 23:16:27'),(5,'Comedy','2006-02-14 23:16:27'),(6,'Documentary','2006-02-14 23:16:27'),(7,'Drama','2006-02-14 23:16:27'),(8,'Family','2006-02-14 23:16:27'),(9,'Foreign','2006-02-14 23:16:27'),(10,'Games','2006-02-14 23:16:27'),(11,'Horror','2006-02-14 23:16:27'),(12,'Music','2006-02-14 23:16:27'),(13,'New','2006-02-14 23:16:27'),(14,'Sci-Fi','2006-02-14 23:16:27'),(15,'Sports','2006-02-14 23:16:27'),(16,'Travel','2006-02-14 23:16:27');
SELECT * FROM category;
CREATE INDEX cat_1 ON category(name);
INSERT INTO category VALUES
(17, 'Act', '2022-03-01 23:16:27');
USE sakila;
-- In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue.
SELECT c.name FROM category c JOIN film_category f ON c.category_id = f.category_id 

