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
