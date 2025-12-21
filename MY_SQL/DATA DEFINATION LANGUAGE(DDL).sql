-- CREATE --
/* CREATE A NEW TABLE CALLED PERSONS 
WITH COLUMNS: id,person_name,birthdate, and phone */

USE MyDatabase;

CREATE TABLE persons (
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY (id)
);