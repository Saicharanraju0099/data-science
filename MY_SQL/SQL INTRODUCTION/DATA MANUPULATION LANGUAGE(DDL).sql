USE MyDatabase;
SELECT * FROM customers

-- INSERT --
INSERT INTO customers(id,first_name,country,score)
VALUES 
    (6,'Jack','USA', NULL),
    (7,'Sam',NULL,100);
SELECT * FROM customers;

-- INSERT USING SELECT --
/* INSERT DATA FROM 'customers' into 'persons' */

INSERT INTO persons(id,person_name,birth_date,phone)
SELECT 
id,
first_name,
NULL,
'Unknown'
FROM customers;
SELECT * FROM persons;

-- UPDATE --
/* CHANGE THE SCORE OF CUSTOMER WITH ID 6 TO 0 */
BEGIN TRANSACTION;
UPDATE customers
SET score = 0
WHERE id = 6;

SELECT * 
FROM customers;
/* UPDATE THE CUSTOMER 7 COUNTRY TO UK */
UPDATE customers
SET country = 'UK'
WHERE id = 7
SELECT * 
FROM customers;

/* UPDATE ALL CUSTOMERS WITH NULL SCORE BY SETTING THEIR SCORE TO 0 */
UPDATE customers
SET score = 0
WHERE score IS NULL

SELECT * 
FROM customers

-- DELETE --
/* DELETE ALL THE CUSTOMERS WITH AN ID GREATER THAN 5 */

DELETE FROM customers
WHERE id > 5;
 
SELECT *
FROM customers;

/* DELETE ALL DATA FROM THE PERSONS TABLE */
TRUNCATE TABLE persons

SELECT *
FROM persons



