-- MIN() AND Max() --
-- TIME SERIES YOY(YEAR OVER YEAR) AND MOM(MONTH OVER MONTH) --
/* ANALYSE THE MONTH OVER MONTH PERFORMANCE BY FINDING THE PERCENTAGE CHANGE
IN SALES BETWEEN THE CURRENT AND PREVIOUS MONTHS */
SELECT
*,
CurrentMonthSales - previousmonthsales as MOM_Change,
ROUND(CAST((CurrentMonthSales - previousmonthsales) as float) / previousmonthsales * 100, 1) as MOM_Percentage
FROM (
SELECT 
MONTH(OrderDate) OrderMonth,
SUM(Sales) CurrentMonthSales,
LAG(SUM(Sales)) over (ORDER BY MONTH(OrderDate)) previousmonthsales
FROM Sales.Orders
GROUP by MONTH(OrderDate)
)t 

-- LEAD() AND LAG() -- 
/* ANALYSE CUSTOMER LOYALITY BY RANKING CUSTOMERS BASED ON THE AVERAGE
NUMBER OF DAYS BETWEEN THIER ORDER */
SELECT
CustomerID,
AVG(DaysUntilNextOrder),
RANK() OVER (ORDER BY COALESCE(AVG(DaysUntilNextOrder),99999)) AS RANK_AVG
FROM(
SELECT
OrderID,
CustomerID,
OrderDate CurrentOrder,
LEAD(OrderDate) OVER (PARTITION by CustomerID order by OrderDate) NextOrder,
DATEDIFF(DAY,OrderDate, LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate)) DaysUntilNextOrder
FROM Sales.Orders
) t
GROUP BY CustomerID

-- FIRST_VALUE/LAST_VALUE() --

/* FIND THE LOWEST AND HIGHEST SALES FOR EACH PRODUCT */
SELECT
OrderID,
ProductID,
Sales,
FIRST_VALUE(Sales) OVER (PARTITION by ProductID order by Sales) lowestSales,
LAST_VALUE(Sales) OVER (PARTITION by ProductID order by Sales 
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) HighestSales,
FIRST_VALUE(Sales) OVER (PARTITION by ProductID order by Sales DESC) HIGHESTSALES2,  -- THIS GIVES SAME EFFECT AS LAST VALUE --
MIN(Sales) OVER (PARTITION by ProductID) AS LOWESTSALES2,  -- THIS GIVES SAME EFFECT AS LAST VALUE --
Max(Sales) OVER (PARTITION by ProductID) AS HIGHESTSALES3,  -- THIS GIVES SAME EFFECT AS LAST VALUE --
Sales - FIRST_VALUE(Sales) OVER (PARTITION by ProductID order by Sales) AS SalesDifference
FROM Sales.Orders