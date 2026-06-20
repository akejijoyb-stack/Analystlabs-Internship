SELECT * FROM Customer;
SELECT TOP 5 *
FROM dbo.Customer;
SELECT TOP 5 *
FROM Invoice;
--1. Top-Performing Customers (Highest Spenders)
SELECT 
    c.CustomerId,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.Country,
    ROUND(SUM(i.Total), 2) AS TotalSpent
FROM 
    Customer c
INNER JOIN 
    Invoice i ON c.CustomerId = i.CustomerId
GROUP BY 
    c.CustomerId, c.FirstName, c.LastName, c.Country
ORDER BY 
    TotalSpent DESC;
--2. Revenue Trends Over Time (Monthly Sales)
SELECT 
    YEAR(i.InvoiceDate) AS SalesYear,
    MONTH(i.InvoiceDate) AS SalesMonth,
    ROUND(SUM(i.Total), 2) AS MonthlyRevenue,
    COUNT(i.InvoiceId) AS TotalInvoices
FROM 
    Invoice i
GROUP BY 
    YEAR(i.InvoiceDate), MONTH(i.InvoiceDate)
ORDER BY 
    SalesYear DESC, SalesMonth DESC;
--3. Most Popular Music Genres (Top Products)
SELECT 
    g.Name AS GenreName,
    COUNT(il.InvoiceLineId) AS TracksSold,
    ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS TotalRevenue
FROM 
    InvoiceLine il
INNER JOIN 
    Track t ON il.TrackId = t.TrackId
INNER JOIN 
    Genre g ON t.GenreId = g.GenreId
GROUP BY 
    g.Name
ORDER BY 
    TracksSold DESC;

 --most expensive tracks within each Media Type (e.g., MPEG audio vs AAC audio).
WITH RankedTracks AS (
    SELECT 
        m.Name AS MediaType,
        t.Name AS TrackName,
        t.UnitPrice,
        ROW_NUMBER() OVER (PARTITION BY t.MediaTypeId ORDER BY t.UnitPrice DESC) AS PriceRank
    FROM 
        Track t
    INNER JOIN 
        MediaType m ON t.MediaTypeId = m.MediaTypeId
)
SELECT * FROM RankedTracks 
WHERE PriceRank <= 5;

--Total Revenue Metric
SELECT 
    ROUND(SUM(Total), 2) AS Aggregate_Music_Revenue
FROM 
    Invoice;