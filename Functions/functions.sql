#creating user defined function

DELIMITER $$   
CREATE FUNCTION get_email(ID INT) RETURNS VARCHAR( 255 )
READS SQL DATA
DETERMINISTIC   
BEGIN   
DECLARE de_email VARCHAR( 255 ) DEFAULT "";  
SELECT FirstName INTO de_email FROM persons WHERE PersonID=ID;  
RETURN de_email;  
END $$  

#calling function
SELECT ID,get_email(ID) as FirstName,EMAIL FROM personsemail;


DROP FUNCTION get_email;

#Built-in functions

SELECT LENGTH(FirstName) FROM Persons;
SELECT UPPER(FirstName) FROM Persons;
SELECT SUBSTR('PANKAJ',2,3);
SELECT CONCAT('PANKAJ ','KUMAR');
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();