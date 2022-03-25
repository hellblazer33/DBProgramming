CREATE DATABASE DBProgramming;

CREATE TABLE Persons (
    PersonID int AUTO_INCREMENT,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    CONSTRAINT PK_Persons PRIMARY KEY (PersonID)
);

INSERT INTO persons
VALUES ('1', 'Kumar', 'Pankaj', 'India', 'Bangalore');

INSERT INTO persons
VALUES (2, 'Doe', 'John', 'USA', 'New York');

SELECT * from dbprogramming.persons;

UPDATE persons
SET LastName = 'Yadav', City = 'Delhi'
WHERE PersonID = 1;

DELETE FROM persons WHERE LastName='Doe';

SELECT * FROM persons
ORDER BY City;

SELECT * FROM persons
ORDER BY City DESC;

SELECT * FROM persons
LIMIT 1;

SELECT * FROM persons
WHERE FirstName LIKE 'P%';


SELECT * FROM persons
WHERE City LIKE '_elhi';

SELECT * FROM persons
WHERE Address IN ('India');

SELECT *
FROM persons
WHERE PersonID BETWEEN 1 AND 2;

SELECT Address AS Country
FROM persons;


CREATE TABLE PersonsEmail (
	ID int AUTO_INCREMENT,
    Email varchar(255),
    CONSTRAINT PK_PersonsEmail PRIMARY KEY (ID)
    
);

SELECT * from PersonsEmail;

INSERT INTO PersonsEmail(Email)
VALUES ('pankaj123@gmail.com'),
('johndoe123@gmail.com');

CREATE TABLE persons (
PersonID int AUTO_INCREMENT,
CONSTRAINT PK_Persons PRIMARY KEY (PersonID));

SELECT persons.PersonID, persons.FirstName
FROM persons
INNER JOIN PersonsEmail ON persons.PersonID=PersonsEmail.ID;


SELECT persons.PersonID, persons.FirstName
FROM persons
INNER JOIN PersonsEmail ON persons.PersonID=PersonsEmail.ID
ORDER BY persons.FirstName;
