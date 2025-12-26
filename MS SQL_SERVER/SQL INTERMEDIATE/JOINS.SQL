USE MyDatabase

-- SQL JOINS --
/* RETRIEVE ALL DATA FROM CUSTOMERS AND ORDERS AS SEPARATE RESULTS */

SELECT * 
FROM customers;

SELECT * 
FROM orders;

-- INNER JOIN --
/* GET ALL CUSTOMERS ALONG WITH THIER ORDERS, BUT ONLY FOR CUSTOMERS WHO
HAVE PLACED AN ORDER */
SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM customers AS C
INNER JOIN orders AS O
ON C.id = O.customer_id

-- LEFT JOIN --
/* GET ALL CUSTOMERS ALONG WITH THEIR ORDERS, INCLUSING THOSE WITHOUT ORDERS */

SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM customers AS C
LEFT JOIN orders AS O
ON C.id = O.customer_id

-- RIGHT JOIN --
/* GET ALL CUSTOMERS ALONG WITH THEIR ORDERS INCLUDING 
ORDERS WITHOUT MATCHING CUSTOMERS */
SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM customers AS C
RIGHT JOIN orders AS O
ON C.id = O.customer_id

--(TASK USING LEFT JOIN )--
/* GET ALL CUSTOMERS ALONG WITH THEIR ORDERS INCLUDING 
ORDERS WITHOUT MATCHING CUSTOMERS */
SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM orders AS O
LEFT JOIN customers AS C
ON C.id = O.customer_id

-- FULL JOIN --
/* GET ALL CUSTOMERS AND ALL ORDERS, EVEN IF THERES IS NO MATCH */

SELECT 
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM orders AS O
FULL JOIN customers AS C
ON C.id = O.customer_id

