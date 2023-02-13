/* Q.1 Write query to create procedure getaddress using cursor to fetch address from address table (schema – sakila).  
Query to use - SELECT address FROM  address;
Cursor Name – addressdetail */
USE sakila;
SELECT address FROM address ORDER BY address_id DESC;

DELIMITER $$ 
CREATE PROCEDURE addressdetail ( INOUT address_det VARCHAR(14000) )
BEGIN
DECLARE finished INT DEFAULT 0;
DECLARE addresslist VARCHAR(500) DEFAULT "";
DECLARE detailaddress CURSOR FOR SELECT address FROM address ORDER BY address_id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished=1;
OPEN detailaddress;
getaddress:LOOP
FETCH detailaddress INTO addresslist;
IF finished =1 THEN LEAVE getaddress ;
END IF;
SET address_det= CONCAT(addresslist,";",address_det);
END LOOP getaddress;
CLOSE detailaddress ;
END $$
DELIMITER ;

SET @address_det ="";
CALL addressdetail (@address_det);
SELECT @address_det;

/* 2. Write query to create procedure getactorname using cursor to fetch first_name,last_name from actor table (schema – sakila).  
Query to use - SELECT first_name, last_name FROM  actor;
Cursor Name – actornamedetail
Fetched data from Cursor is given below:
Value for First Name */
USE sakila;
SELECT * FROM actor ORDER BY actor_id DESC;

DELIMITER $$ 
CREATE PROCEDURE actornamedetail( INOUT nameactor VARCHAR(16000),INOUT lastname VARCHAR(16000))
BEGIN
DECLARE finished INT DEFAULT 0;
DECLARE actornamelist VARCHAR(500) DEFAULT "";
DECLARE actornamelist2 VARCHAR(500) DEFAULT "";
DECLARE detailactorname CURSOR FOR SELECT first_name FROM actor ORDER BY actor_id;
DECLARE detailactorname2 CURSOR FOR SELECT last_name FROM actor ORDER BY actor_id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished=1;
OPEN detailactorname;
OPEN detailactorname2;
getactorname:LOOP
FETCH detailactorname INTO actornamelist;
FETCH detailactorname2 INTO actornamelist2;
IF finished =1 THEN LEAVE getactorname ;
END IF;
SET nameactor= CONCAT(actornamelist,";",nameactor);
SET lastname= CONCAT(actornamelist2,";",lastname);
END LOOP getactorname;
CLOSE detailactorname;
END $$
DELIMITER ;

SET @nameactor ="";
SET @lastname ="";
CALL actornamedetail (@nameactor,@lastname);

SELECT CONCAT(@nameactor,@lastname);