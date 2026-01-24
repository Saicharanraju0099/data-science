-- TIME STAMP --

SELECT 
OrderID,
OrderDate,
ShipDate,
CreationTime
FROM Sales.Orders


SELECT 
OrderID,
CreationTime,
'2025-08-20' AS HardCoded,
GETDATE() AS TODAY
FROM Sales.Orders

-- YEAR() --
SELECT 
OrderID,
CreationTime,
YEAR(CreationTime) AS YEAR,
MONTH(CreationTime) AS MONTH,
DAY(CreationTime) AS DAY
FROM Sales.Orders

-- DatePart --
SELECT 
OrderID,
CreationTime,
DATEPART(YEAR, CreationTime) Year_dp,
DATEPART(MONTH, CreationTime) Month_dp,
DATEPART(DAY, CreationTime) Day_dp,
DATEPART(HOUR, CreationTime) Hour_dp,
DATEPART(SECOND, CreationTime) seconds_dp,
DATEPART(QUARTER, CreationTime) Quater_dp,
DATEPART(WEEK, CreationTime) Week_dp,
YEAR(CreationTime) AS YEAR
FROM Sales.Orders


-- Date Name --

SELECT 
OrderID,
CreationTime,
DATENAME(Month,CreationTime) AS Month_dn,
DATENAME(WEEKDAY,CreationTime) AS WeekDay,
YEAR(CreationTime) AS YEAR
FROM Sales.Orders

-- Date Trunc --
SELECT 
    OrderID,
    CreationTime,
    DATEADD(MINUTE, DATEDIFF(MINUTE, 0, CreationTime), 0) AS Minute_dt,
    DATEADD(DAY, DATEDIFF(DAY, 0, CreationTime), 0) AS Day_dt,
    DATEADD(YEAR, DATEDIFF(YEAR, 0, CreationTime), 0) AS Minute_dt,
    YEAR(CreationTime) AS OrderYear
FROM Sales.Orders;

SELECT
    DATEADD(MONTH, DATEDIFF(MONTH, 0, CreationTime), 0) AS Month_dt,
    COUNT(*) AS OrderCount
FROM Sales.Orders
GROUP BY DATEADD(MONTH, DATEDIFF(MONTH, 0, CreationTime), 0);

-- EOMONTH() --

SELECT
    OrderID,
    CreationTime,
    EOMONTH(CreationTime) AS EndOfMonth,
    DATEADD(MONTH, DATEDIFF(MONTH, 0, CreationTime), 0) AS StartOfMonth
FROM Sales.Orders;

-- HOW MANY ORDERS WERE PLACED EACH YEAR ? --
SELECT 
YEAR(OrderDate),
COUNT(*) AS NoOfOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)

-- HOW MANY ORDERS WERE PLACED ON EACH MONTH ? --
SELECT
    DATENAME(MONTH,OrderDate),
    COUNT(*) AS NoOfOrders
    FROM Sales.Orders
GROUP BY  DATENAME(MONTH, OrderDate)

-- PART EXTRACTION --
-- DATA FILTERING --
-- SHOW ALL ORDERS THAT WERE PLACED DURING MONTH OF FEBRUARY --
SELECT *
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2

-- FORMAT AND CASTING --
SELECT
    OrderID,
    CreationTime,
    'DAY ' + FORMAT(CreationTime, 'ddd')  CustomFormat
FROM Sales.Orders;

-- Show Creation Time using the fallowing format:
-- Day Wed Jan Q1 2025 12:34:56 PM --

SELECT
    OrderID,
    CreationTime,

    'Day ' +
    LEFT(DATENAME(WEEKDAY, CreationTime), 3) + ' ' +
    LEFT(DATENAME(MONTH, CreationTime), 3) + ' ' +
    'Q' + CAST(DATEPART(QUARTER, CreationTime) AS varchar(1)) + ' ' +
    CAST(YEAR(CreationTime) AS varchar(4)) + ' ' +
    RIGHT('0' + CAST(
        CASE 
            WHEN DATEPART(HOUR, CreationTime) % 12 = 0 
            THEN 12 
            ELSE DATEPART(HOUR, CreationTime) % 12 
        END AS varchar(2)
    ), 2) + ':' +
    RIGHT('0' + CAST(DATEPART(MINUTE, CreationTime) AS varchar(2)), 2) + ':' +
    RIGHT('0' + CAST(DATEPART(SECOND, CreationTime) AS varchar(2)), 2) + ' ' +
    CASE 
        WHEN DATEPART(HOUR, CreationTime) >= 12 THEN 'PM'
        ELSE 'AM'
    END
    AS CustomFormat
FROM Sales.Orders;
