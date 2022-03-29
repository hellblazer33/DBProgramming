DELIMITER $$
CREATE PROCEDURE list_name(INOUT name_list varchar(4000))
BEGIN
DECLARE is_done INTEGER DEFAULT 0;
DECLARE p_name varchar(100) DEFAULT "";
DECLARE person_cursor CURSOR FOR
SELECT FirstName FROM persons;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done = 1;
OPEN person_cursor;
get_list:LOOP
FETCH person_cursor INTO p_name;
IF is_done = 1 THEN
LEAVE get_list;
END IF;
SET name_list = CONCAT(p_name,";",name_list);
END LOOP get_list;
CLOSE person_cursor;
END $$


SET @name_list ="";  
CALL list_name(@name_list);  
SELECT @name_list;  
