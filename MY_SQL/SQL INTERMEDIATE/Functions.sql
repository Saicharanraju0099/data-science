-- STRING FUNCTIONS --
/* CONCATENATE FIRST NAME AND COUNTRY INTO ONE COLUMN */
use MyDatabase;
SELECT 
first_name,
country,
CONCAT(first_name, country) AS name_country 
FROM customers;