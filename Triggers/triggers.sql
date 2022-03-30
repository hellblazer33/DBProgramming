#insert trigger

DELIMITER //  
Create Trigger before_insert_persons   
BEFORE INSERT ON persons FOR EACH ROW  
BEGIN  
IF NEW.city = 'Delhi' THEN SET NEW.city = 'Lucknow';  
END IF;  
END //  


INSERT INTO persons
VALUES (5, 'Waugh', 'Sam', 'India', 'Delhi');

SELECT * FROM Persons;  --


#before update trigger

DELIMITER $$  
  
CREATE TRIGGER before_update_persons  
BEFORE UPDATE  
ON persons FOR EACH ROW  
BEGIN  
    DECLARE error_msg VARCHAR(255);  
    SET error_msg = ('The city cannot be Delhi');  
    IF new.city = 'Delhi' THEN  
    SIGNAL SQLSTATE '45000'   
    SET MESSAGE_TEXT = error_msg;  
    END IF;  
END $$  


DROP TRIGGER dbprogramming.before_update_persons;  

UPDATE persons SET city = 'Delhi' WHERE PersonID = 1;   --- 

CREATE TABLE persons_log(    
    user varchar(255) NOT NULL,    
    descreptions varchar(255) NOT NULL  
); 
DROP TABLE persons_log;

#after update triggers

DELIMITER $$  
  
CREATE TRIGGER after_update_persons
AFTER UPDATE  
ON persons FOR EACH ROW  
BEGIN  
    INSERT into persons_log VALUES (user(),   
    CONCAT('Update Person Record ', OLD.FirstName, ' Previous City :',  
    OLD.city, ' Present City ', NEW.city));  
END $$  
DELIMITER ;  

UPDATE persons 
SET City = 'Chennai' 
WHERE PersonID = 5;  

SELECT * FROM persons_log --

SHOW TRIGGERS;
 
 CREATE TABLE persons_archives (  
    PersonID int AUTO_INCREMENT,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),  
    CONSTRAINT PK_Persons PRIMARY KEY (PersonID),
    deleted_time TIMESTAMP DEFAULT NOW()  
);  
 
 
 #Before Delete Trigger
DELIMITER $$  

CREATE TRIGGER before_delete_persons 
BEFORE DELETE  
ON persons FOR EACH ROW  
BEGIN  
    INSERT INTO persons_archives (LastName, FirstName, City)  
    VALUES(OLD. LastName, OLD.FIrstName, OLD.City);  
END$$   
  
DELIMITER ; 


DELETE FROM persons WHERE City = 'Mumbai';  

SELECT * FROM persons_archives;  --

#after delete trigger

CREATE TABLE citydata(  
    City varchar(255)  
) ; 
INSERT INTO citydata  
SELECT City FROM persons;


DELIMITER $$  
  
CREATE TRIGGER after_delete_persons  
AFTER DELETE  
ON persons FOR EACH ROW  
BEGIN  
   UPDATE citydata SET city = 'Kansas' WHERE city = 'Chicago';  
END$$   
  
DELIMITER ;  

DROP TRIGGER after_delete_persons 

SELECT * FROM persons;

DELETE FROM persons WHERE PersonID = 3;  

SELECT * FROM citydata;  --