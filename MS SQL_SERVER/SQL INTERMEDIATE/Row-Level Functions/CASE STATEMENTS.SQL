-- CASE STATEMENTS --
/* GENERATE A REPORT SHOWING THE TOTAL SALES FOR EACH CATEGORY:
- HIGH : IF THE SALES HIGHER THAN 50
- MEDIUM : IF THE SALES BETWEEN 20-50
- LOW : IF THE SALES LOW (2O OR LESS)
SORT THE CATEGORY FROM HIGHEST SALES TO LOWEST */
SELECT
Category,
SUM(Sales) AS TOTALSALES
FROM(
    SELECT
    OrderID,
    Sales,
    CASE 
        WHEN Sales > 50 THEN 'HIGH'
        WHEN Sales > 20 THEN 'MEDIUM'
        ELSE 'LOW'
    END Category
    FROM Sales.Orders
)t 
GROUP by Category
ORDER BY TOTALSALES DESC


/* RETRIVE EMPLOYEE DETAILS WITH GENDER DISPLAYED AS FULL TEXT */
SELECT
EmployeeID,
FirstName,
LastName,
Gender,
CASE 
    WHEN Gender = 'F' THEN 'Female' 
    WHEN Gender = 'M' THEN 'Male'
    ELSE 'Not Available'
END AS GENDERFULLTEXT
FROM Sales.Employees

/* RETRIVE CUSTOMER DETAILS WITH ABBREVIATED COUNTRY CODE */
SELECT
    CustomerID,
    FirstName,
    LastName,
    Country,
    CASE 
        WHEN Country = 'Germany' THEN 'DE'
        WHEN Country = 'USA'     THEN 'US'
        ELSE 'n/a'
    END AS COUNTRY_ABBR,

    CASE Country
        WHEN 'Germany' THEN 'DE'
        WHEN 'USA'     THEN 'US'
        ELSE 'n/a'
    END AS COUNTRY_ABBR1
FROM Sales.Customers 

/*FIND THE AVERAGE SCORES OF CUSTOMERS AND TREAT NULLS AS 0
ADDITIONALLY PROVIDE DETAILS SUCH AS CUSTOMERID AND LASTNAME */
SELECT
CustomerID,
LastName,
Score,
CASE 
    WHEN Score IS NULL THEN 0
    ELSE Score 
END ScoreClean,

AVG(CASE 
        WHEN Score IS NULL THEN 0
        ELSE Score 
    END) OVER() AvgCustomerClean,

AVG(Score) OVER() avgcustomer
FROM Sales.Customers 

/* COUNT HOW MANY TIMES EACH CUSTOMER HAS MADE AN ORDER WITH SALES GREATER THAN 30 */
SELECT
    CustomerID,
    SUM(CASE
        WHEN Sales > 30 THEN 1
        ELSE 0
    END) TotalOrdersHighSales,
    COUNT(*) TotalOrders
FROM Sales.Orders
GROUP BY CustomerID