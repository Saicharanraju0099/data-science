USE MyDatabase;
SELECT * FROM customers

-- INSERT --
INSERT INTO customers(id,first_name,country,score)
VALUES 
    (6,'Jack','USA', NULL),
    (7,'Sam',NULL,100)
SELECT * FROM customers

-- INSERT USING SELECT --
/* INSERT DATA FROM 'customers' into 'persons' */

SELECT 
id,
first_name,
NULL,
'Unknown'
FROM customers

