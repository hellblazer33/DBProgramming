CREATE UNIQUE INDEX person_index ON persons(PersonID);
SELECT * FROM persons;
SHOW INDEX FROM persons;

CREATE UNIQUE INDEX person_index_desc ON persons (FirstName DESC);

SELECT * FROM persons WHERE FirstName = 'Pankaj';