CREATE VIEW view_data as SELECT Persons.LastName, Persons.FirstName FROM Persons;
SELECT * FROM view_data;


ALTER VIEW view_data AS    
SELECT Persons.LastName, Persons.FirstName    
FROM persons
WHERE LastName='Kumar';    


CREATE OR REPLACE VIEW view_data AS
SELECT Persons.LastName, Persons.FirstName    
FROM persons
WHERE LastName='Kumar';


DROP view view_data;