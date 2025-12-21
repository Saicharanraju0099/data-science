-- CREATE --
/* CREATE A NEW TABLE CALLED PERSONS 
WITH COLUMNS: id,person_name,birthdate, and phone */

CREATE TABLE persons(
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY(id)
)
SELECT * FROM persons

-- ALTER --
/* ADD A NEW COLUMN CALLED EMAIL TO THE PERSONS TABLE */
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;
SELECT * from persons;

-- DROP --
/* REMOVE THE COLUMN PHONE FROM THE PERSONS TABLE */
ALTER TABLE persons
DROP COLUMN phone;
SELECT * FROM persons;

/* DELETE THE TABLE persons FROM THE DATA BASE */

DROP TABLE persons
