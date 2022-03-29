DELIMITER $$   
CREATE FUNCTION get_email(ID INT) RETURNS VARCHAR( 255 )
READS SQL DATA
DETERMINISTIC   
BEGIN   
DECLARE de_email VARCHAR( 255 ) DEFAULT "";  
SELECT FirstName INTO de_email FROM persons WHERE PersonID=ID;  
RETURN de_email;  
END $$  

DROP FUNCTION get_email;
SELECT ID,get_email(ID) as FirstName,EMAIL FROM personsemail;
