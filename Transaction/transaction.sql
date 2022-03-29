START TRANSACTION;  
    
INSERT INTO persons(PersonID, LastName, FirstName, Address,City)   
VALUES (2, 'Weins', 'Mark', 'Canada','USA');  
       
COMMIT;  

SELECT * FROM persons;

#SavePoint in Transaction

START TRANSACTION;  
  
SELECT * FROM persons;  
  
INSERT INTO persons(LastName, FirstName, Address,City)   
VALUES ('Mayer', 'Sam', 'USA','USA')  ;
  
SAVEPOINT my_savepoint;  
  
INSERT INTO persons(LastName, FirstName, Address,City)   
VALUES ('Smith', 'Will', 'Canada','USA'); 
  
ROLLBACK TO SAVEPOINT my_savepoint;  
  
INSERT INTO persons(LastName, FirstName, Address,City)   
VALUES ('Singh', 'Ramesh', 'India','Hyderabad');
  
COMMIT; 

SELECT * FROM persons;