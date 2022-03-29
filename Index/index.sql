CREATE UNIQUE INDEX person_index ON persons(PersonID);

SHOW INDEX FROM persons;

CREATE UNIQUE INDEX person_index_desc ON persons (FirstName DESC)