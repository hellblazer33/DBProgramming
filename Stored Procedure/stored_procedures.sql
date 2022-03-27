DELIMITER &&  
CREATE PROCEDURE get_all_data ()  
BEGIN  
    SELECT * FROM persons;   
END &&  
DELIMITER ;  

CALL get_all_data();



DELIMITER &&  
CREATE PROCEDURE insert_data ()  
BEGIN  
    INSERT INTO persons
VALUES ('3','Weins', 'Mark', 'USA', 'Chicago');   
END &&  
DELIMITER ;  

CALL insert_data();

SELECT * FROM persons;



DELIMITER &&  
CREATE PROCEDURE get_data (IN var1 INT)  
BEGIN  
    SELECT * FROM persons LIMIT var1;  
END &&  
DELIMITER ;  

call get_data(2);


DELIMITER &&  
CREATE PROCEDURE max_id (OUT maxid INT)  
BEGIN  
    SELECT MAX(PersonID) INTO maxid FROM persons;   
END &&  
DELIMITER ;  

call max_id(@M);
select @M;



DELIMITER &&  
Create PROCEDURE insert_persons(IN p_lastname varchar(255),IN p_firstname varchar(255),IN p_Address Varchar(255), IN p_city Varchar(255))
BEGIN  
    insert into persons(LastName, FirstName, Address, City) values (p_lastname, p_firstname,p_address, p_city);   
END &&  
DELIMITER ; 


CALL insert_persons('Sharma','Raman','India','Mumbai')

