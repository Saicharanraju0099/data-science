-- ROW NUMBER() --
-- ASSIGN A UNIQUE NUMBER TO EACH ROW --
-- IT DOESN'T HANDLE TIES --
/* RANK THE ORDERS BASED ON THEIR SALES FROM HIGHEST TO LOWEST */
SELECT
    OrderID,
    ProductID,
    Sales,
    ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRank_Row,  --unique rank --,-- Doesn't Handle Ties --, -- No Gaps In Rank --
    RANK() OVER(ORDER BY Sales DESC) Sales_Rank,           -- Shared Rank --, -- Handles Ties --, -- Gaps In Rank -- 
    DENSE_RANK() OVER(ORDER BY Sales DESC) SalesRank_Dense -- Shared Rank --, -- Handles Ties --, -- No Gaps In Rank --
FROM Sales.Orders

/* FIND THE TOP HIGHEST SALES FOR EACH PRODUCT */
SELECT *
FROM(
SELECT
OrderID,
ProductID,
Sales,
ROW_NUMBER() OVER(PARTITION BY ProductID order by Sales DESC) RankByProduct
FROM Sales.Orders
)t WHERE RankByProduct = 1

/* FIND THE LOWEST 2 CUSTOMERS BASED ON THEIR TOTAL SALE */
SELECT *
FROM (
SELECT
    CustomerID,
    SUM(Sales) TotalSales,
    ROW_NUMBER() OVER(order by SUM(Sales)) RankCustomers
FROM Sales.Orders
GROUP by CustomerID
)t WHERE RankCustomers <= 2

/* ASSIGN UNIQUE ID'S TO THE ROWS OF THE 'Orders Archive' TABLE */
SELECT
ROW_NUMBER() OVER (order by OrderID, OrderDate) UniqueID,
*
FROM Sales.OrdersArchive

/* IDENTIFY DUPLICATE ROWS IN THE TABLE 'Orders Archieve' AND RETURN 
A CLEAN RESULT WITHOUT ANY DUPLICATES */
SELECT 
*
FROM (
SELECT
ROW_NUMBER() OVER (PARTITION BY OrderID order by CreationTime DESC) ranknumber,
*
FROM Sales.OrdersArchive
)t WHERE ranknumber = 1

-- NTILE() --
-- DIVIDES THE ROWS INTO A SPECIFIED NUMBER OF APPROXIMATELY EQUAL GROUPS(BUCKETS) --
SELECT
OrderID,
Sales,
NTILE(1) OVER(order by Sales DESC) ONEBUCKET,
NTILE(2) OVER(order by Sales DESC) TWOBUCKET,
NTILE(3) OVER(order by Sales DESC) THREEBUCKET,
NTILE(4) OVER(order by Sales DESC) FOURBUCKET
FROM Sales.Orders

/* SEGMENT ALL ORDERS IN TO 3 CATEGORIES: HIGH, MEDIUM, AND LOW SALES */
SELECT
*,
CASE WHEN Buckets = 1 THEN 'HIGH'
     WHEN Buckets = 2 THEN 'MEDIUM'
     WHEN Buckets = 3 THEN 'LOW'
END SALESSEGEMENTATIONS
FROM (
SELECT
OrderID,
Sales,
NTILE(3) OVER (ORDER by Sales DESC) Buckets
FROM Sales.Orders
)t

-- In Order To Export The Data, Divide The Orders In To 2 Groups --
SELECT
NTILE(4) OVER (ORDER BY OrderID) BUCKETS,
*
FROM Sales.Orders

-- RANK WINDOW FUNCTION --
-- CUME_DIST --
/* FIND THE PRODUCTS THAT FALL WITHIN THE HIGHEST 40% OF THEIR PRICES */
SELECT
*,
CONCAT(DistRank * 100, '%') DistRankPercentage
FROM (
SELECT
    Product,
    Price,
    CUME_DIST() OVER(ORDER BY Price DESC) DistRank
FROM Sales.Products
)t 
WHERE DistRank <= 0.4