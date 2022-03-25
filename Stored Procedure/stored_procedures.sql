DELIMITER &&  
CREATE PROCEDURE get_all_data ()  
BEGIN  
    SELECT * FROM persons;   
END &&  
DELIMITER ;  

CALL get_all_data();