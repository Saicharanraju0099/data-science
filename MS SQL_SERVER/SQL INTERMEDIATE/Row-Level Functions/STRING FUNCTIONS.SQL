-- STRING FUNCTIONS --
-- CONCATE --
/* CONCATENATE FIRST NAME AND COUNTRY INTO ONE COLUMN */
USE MyDatabase
SELECT 
    first_name,
    country,
    CONCAT(first_name,' - ',country) AS name_country 
FROM customers
-- LOWER() --
/* TRANSFORM THE CUSTOMERS FIRST NAME TO LOWERCASE */
SELECT 
    first_name,
    country,
    CONCAT(first_name,' - ',country) AS name_country,
    LOWER(first_name) AS lower_name
FROM customers
-- UPPER() --
/* TRANSFORM THE CUSTOMERS FIRST NAME TO UPPERCASE */
SELECT 
    first_name,
    country,
    CONCAT(first_name,' - ',country) AS name_country,
    UPPER(first_name) AS upper_name
FROM customers
-- TRIM() --
/* FIND CUSTOMERS WHOSE FIRST NAME CONTAINS LEADING OR TRAILING SPACES */
SELECT 
    first_name,
    LEN(first_name) AS  LEN_NAME,
    LEN(TRIM(first_name)) AS LEN_TRIM_NAME,
    LEN(first_name) - LEN(TRIM(first_name)) AS FLAG
FROM customers
WHERE first_name != TRIM(first_name)

-- REPLACE --
/* REMOVE DASHES (-) FROM A PHONE NUMBER */

SELECT 
'123-456-7890' AS PHONE,
REPLACE('123-456-7890','-','') AS CLEAN_PHONE

/* REPLACE FILE EXTENCE FROM TXT TO CSV */
SELECT
'report.txt' AS old_filename,
REPLACE('report.txt','.txt','.csv') AS new_filename

-- LEN() --
/* CALCULATE THE LENGTH OF EACH CUSTOMERS FIRST NAME */
SELECT
    first_name,
    LEN(first_name) AS len_name
FROM customers

-- LEFT() --
/* RETRIVE THE FIRST TWO CHARACTERS OF EACH FIRST NAME */
SELECT
    first_name,
    LEFT(TRIM(first_name),2) AS first_2_char
FROM customers

-- RIGHT() --
/* RETRIVE THE LAST TWO CHARACTERS OF EACH FIRST NAME */
SELECT
    first_name,
    RIGHT(TRIM(first_name),2) AS last_2_char
FROM customers

-- SUB STRING --
/* RETRIVE A LIST OF CUSTOMERS FIRST NAMES AFTER REMOVING THE FIRST CHARACTER */
SELECT 
    first_name,
    SUBSTRING(TRIM(first_name),2,LEN(first_name)) AS sub_name
FROM customers