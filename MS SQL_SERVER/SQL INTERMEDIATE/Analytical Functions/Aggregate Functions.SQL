
USE MyDatabase
-- Aggregate Function --
SELECT
COUNT(*) AS total_number_of_orders
FROM orders

/* FIND THE TOTAL SALES OF ALL ORDERS */
SELECT 
customer_id,
COUNT(*) AS TOTAL_NUMBER_OF_ORDERS,
SUM(sales) AS total_sales,
AVG(sales) as avg_sales,
MAX(sales) as max_sales,
MIN(sales) as lowest_sales
FROM orders
GROUP BY customer_id