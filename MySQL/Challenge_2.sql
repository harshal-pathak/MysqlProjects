CREATE DATABASE Challenge_2;
USE Challenge_2;
CREATE TABLE IF NOT EXISTS actor(
actor_id 	SMALLINT 	NOT NULL,  

first_name 	VARCHAR(45)		NOT NULL,

last_name 	VARCHAR(45) 	NOT NULL,

PRIMARY KEY (actor_id)
);
USE Challenge_2;
CREATE TABLE IF NOT EXISTS country(
country_id 	SMALLINT  	NOT NULL,  

country 	VARCHAR(50) 	NOT NULL,

last_update 	TIMESTAMP 	NOT NULL ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (country_id) 
);
USE Challenge_2;
CREATE TABLE IF NOT EXISTS city(
city_id 	SMALLINT 	NOT NULL,  

city 	VARCHAR(50) 	NOT NULL,

country_id 	SMALLINT  	NOT NULL, 

last_update 	TIMESTAMP 	NOT NULL ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (city_id),
 
FOREIGN KEY (country_id) REFERENCES  country (country_id)
);

USE Challenge_2;
CREATE TABLE IF NOT EXISTS address(
address_id 	SMALLINT  	NOT NULL,  

address 	VARCHAR(50) 	NOT NULL,

address2 	VARCHAR(50) 	DEFAULT NULL,

district 	VARCHAR(20) 	NOT NULL,

city_id 	SMALLINT  	NOT NULL, 

postal_code 	VARCHAR(10)  	DEFAULT NULL,

phone 	VARCHAR(20) 	NOT NULL,

last_update 	TIMESTAMP 	NOT NULL ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (address_id), 

FOREIGN KEY (city_id) REFERENCES city (city_id)
);

CREATE TABLE IF NOT EXISTS customer(
Field 	VARCHAR(50),
Type   VARCHAR(50),
Nul 	ENUM('YES','NO'),
Keyy     VARCHAR(20),
Defaultt 	VARCHAR(20) 	
);	
INSERT INTO customer (Field,Type,Nul,Keyy) VALUES
('customer_id','smallint unsigned','NO','PRI'),
('store_id','tinyint unsigned','NO','MUL'),
('first_name','VARCHAR(45)','NO',''),
('last_name','VARCHAR(45)','NO','MUL'),
('email','VARCHAR(50)','Yes',''),
('address_id','smallint unsigned','NO','MUL');
INSERT INTO customer VALUES
('active','tinyint(1)','NO','','1');
INSERT INTO customer (Field,Type,Nul,Keyy) VALUES
('create_date','datetime','NO','');
INSERT INTO customer VALUES
('lastupdate','timestamp','YES','','CURRENT_TIMESTAMP');
SELECT * FROM customer;
CREATE TABLE IF NOT EXISTS rental(
Field 	VARCHAR(50),
Type   VARCHAR(50),
Nul 	ENUM('YES','NO'),
Keyy     VARCHAR(20),
Defaultt 	VARCHAR(20),
Extra		VARCHAR(50) 	
);
INSERT INTO rental (Field,Type,Nul,Keyy,Extra) VALUES
('rental_id','int','NO','PRI','auto_increment'),
('rental_date','datetime','NO','MUL',''),
('inventory_id','mediumint unsigned','NO','MUL',''),
('customer_id','smallint','NO','MUL',''),
('return_date','datetime','YES','',''),
('staff_id','tiny int unsigned','NO','MUL','');
INSERT INTO rental VALUES
('last_update','timestamp','NO','','Current_Timestamp','Default Generated on update current TI');
SELECT * FROM rental;

