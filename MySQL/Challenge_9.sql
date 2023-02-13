-- Q.1 Write query to create table product with below shown structure Figure 1. (schema – sakila). 
USE sakila;
CREATE TABLE IF NOT EXISTS product(
product_id 	INT 	PRIMARY KEY,
product_name 	VARCHAR(50),
preventile_maintenance 	JSON,
repair_schedule 	JSON);
DESC product;

-- Q.2 Write query to insert rows in table product, values can be taken from below shown Figure 2. (schema – sakila).
USE sakila;
INSERT INTO product (product_id,product_name,preventile_maintenance,repair_schedule) VALUES
(101,'Honda Amzae','{"Part":"Motor","EngineerName":"Astha","MaintenanceDate":"1989-02-16"}',
'{"repairDate":"1992-10-14","Expenditure":9000}'),
(102,'Honda City','{"Part":"Stering","EngineerName":"Mayank","MaintenanceDate":"1985-04-16"}',
'{"repairDate":"1989-01-14","Expenditure":19000}'),
(103,'Honda WR-V','{"Part":"Seat","EngineerName":"Neha","MaintenanceDate":"1993-03-12"}',
'{"repairDate":"1994-01-14","Expenditure":10000}'),
(104,'Honda Jazz','{"Part":"Motor","EngineerName":"Astha","MaintenanceDate":"1997-02-10"}',
'{"repairDate":"1996-01-12","Expenditure":5000}'),
(105,'Honda BR-V','{"Part":"CluchPlate","EngineerName":"Sameer","MaintenanceDate":"2020-02-10"}',
'{"repairDate":"2020-01-03","Expenditure":45000}');
SELECT * FROM product;

-- Q.3 Write query to select result set from table product as shown in Figure 3. (schema – sakila).
SELECT product_id, product_name, preventile_maintenance ->> '$.Part' Part,  preventile_maintenance ->> '$.MaintenanceDate' MaintenanceDate,
repair_schedule ->> '$.Expenditure' Expenditure FROM product;

-- Q.4 Write query to select result set from table product as shown in Figure 4. (schema – sakila). 
SELECT product_id, product_name, preventile_maintenance ->> '$.EngineerName' EngineerName, 
preventile_maintenance ->> '$.MaintenanceDate' MaintenanceDate FROM product;

-- Q.5 Write query to select result set from table product as shown in Figure 5. (schema – sakila). 
SELECT product_id, product_name, preventile_maintenance ->> '$.Part' Part,
 preventile_maintenance ->> '$.EngineerName' EngineerName, 
 preventile_maintenance ->> '$.MaintenanceDate' MaintenanceDate,
 repair_schedule ->> '$.repairDate' RepairDate,
 repair_schedule ->> '$.Expenditure' Expenditure FROM product;
 