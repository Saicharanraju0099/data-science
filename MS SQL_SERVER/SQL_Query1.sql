-- Use Data Base --
USE MyDatabase
SELECT * 
FROM customers

-- RETRIVE ALL ORDER DATA --
SELECT * FROM
orders

-- RETRIVE EACH CUSTOMER'S NAME,COUNTRY AND SCORE --
SELECT 
    first_name,
    country,
    score
FROM customers