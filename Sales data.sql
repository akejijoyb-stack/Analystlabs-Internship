SELECT DISTINCT 
    CUSTOMERNAME,
    PHONE,
    ADDRESSLINE1,
    ADDRESSLINE2,
    CITY,
    COUNTRY
FROM 
    [sales_data_sample];

SELECT 
    ORDERNUMBER,
    PRODUCTCODE,
    QUANTITYORDERED,
    PRICEEACH,
    ROUND(CAST(SALES AS float), 2) AS CLEAN_SALES,
    ORDERDATE,
    STATUS,
    PRODUCTLINE,
    CUSTOMERNAME,
    PHONE,
    ADDRESSLINE1,
    -- Replaces empty or NULL address lines with 'N/A' so the data looks neat
    ISNULL(NULLIF(ADDRESSLINE2, ''), 'N/A') AS CLEAN_ADDRESSLINE2,
    CITY,
    COUNTRY,
    DEALSIZE
FROM 
    [sales_data_sample];

SELECT 
    PRODUCTCODE,
    SUM(CAST(SALES AS float)) AS TotalRevenue,
    SUM(CAST(QUANTITYORDERED AS int)) AS TotalQuantitySold,
    COUNT(DISTINCT ORDERNUMBER) AS TotalOrders
FROM 
    [sales_data_sample] 
GROUP BY 
    PRODUCTCODE
ORDER BY 
    TotalRevenue DESC;

--1. Revenue Trends Over Time (Sales by Year and Month)
SELECT 
    YEAR_ID AS SalesYear,
    MONTH_ID AS SalesMonth,
    ROUND(SUM(CAST(SALES AS float)), 2) AS TotalRevenue,
    COUNT(DISTINCT ORDERNUMBER) AS TotalOrders
FROM 
    [sales_data_sample]
GROUP BY 
    YEAR_ID, 
    MONTH_ID
ORDER BY 
    SalesYear DESC, 
    SalesMonth DESC;
    
    --2. Top-Performing Customers (Highest Spenders)
    SELECT 
    CUSTOMERNAME,
    COUNTRY,
    ROUND(SUM(CAST(SALES AS float)), 2) AS TotalSpent,
    COUNT(DISTINCT ORDERNUMBER) AS TotalOrdersPlaced
FROM 
    [sales_data_sample]
GROUP BY 
    CUSTOMERNAME, 
    COUNTRY
ORDER BY 
    TotalSpent DESC;

    --3. Customer Purchasing Behavior (Deal Size & Order Status)
   
   SELECT 
    DEALSIZE,
    COUNT(DISTINCT ORDERNUMBER) AS TotalOrders,
    ROUND(SUM(CAST(SALES AS float)), 2) AS TotalRevenue
FROM 
    [sales_data_sample]
GROUP BY 
    DEALSIZE
ORDER BY 
    TotalRevenue DESC;

--WINDOW FUNCTIONS
WITH ProductRevenue AS (
  SELECT 
     PRODUCTLINE,
     PRODUCTCODE,
     ROUND(SUM(CAST(SALES AS float)), 2) AS TotalSales,
        DENSE_RANK() OVER (PARTITION BY PRODUCTLINE ORDER BY SUM(CAST(SALES AS float)) DESC) AS ProductRank
    FROM 
        [sales_data_sample]
    GROUP BY 
        PRODUCTLINE, 
        PRODUCTCODE
)
SELECT * FROM ProductRevenue
WHERE ProductRank <= 3; -- Show only the top 3 products for every single product line

--GROSS TOTAL REVENUE
SELECT 
    ROUND(SUM(CAST(SALES AS float)), 2) AS Gross_Total_Revenue
FROM 
    [sales_data_sample]