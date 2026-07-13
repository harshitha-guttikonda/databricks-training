-- ============================================================
-- Data Cleaning
-- ============================================================
use RetailDB;

-- Display Customers Table
SELECT * FROM Customers;

-- Display Sales Table
SELECT * FROM Sales;

-- Remove NULL customer_id
SELECT *
FROM Customers
WHERE customer_id IS NOT NULL;

-- Remove NULL sale_id
SELECT *
FROM Sales
WHERE sale_id IS NOT NULL;

-- Remove Duplicate Customers
SELECT DISTINCT *
FROM Customers;

-- Remove Duplicate Sales
SELECT DISTINCT *
FROM Sales;

-- Filter Invalid Sales Amount
SELECT *
FROM Sales
WHERE total_amount >= 0;

-- Check Column Data Types
EXEC sp_help Customers;

EXEC sp_help Sales;

-- ============================================================
-- Task 1 : Daily Sales
-- Output : sale_date, total_sales
-- ============================================================
PRINT 'Task 1 : Daily Sales';
PRINT 'Displaying Total Sales for Each Day';
SELECT
    sale_date,
    SUM(total_amount) AS total_sales
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;

-- ============================================================
-- Task 2 : City-wise Revenue
-- Output : city, total_revenue
-- ============================================================
PRINT 'Task 2 : City-wise Revenue';
PRINT 'Displaying Total Revenue for Each City';
SELECT
    c.city,
    SUM(s.total_amount) AS total_revenue
FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- ============================================================
-- Task 3 : Top 5 Customers
-- Output : customer_name, total_spend
-- ============================================================
PRINT 'Task 3 : Top 5 Customers';
PRINT 'Displaying Top 5 Customers Based on Total Spend';
SELECT TOP 5
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_amount) AS total_spend
FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spend DESC;

-- ============================================================
-- Task 4 : Repeat Customers (>1 Order)
-- Output : customer_id, order_count
-- ============================================================
PRINT 'Task 4 : Repeat Customers';
PRINT 'Displaying Customers Who Placed More Than One Order';
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(s.sale_id) AS order_count
FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(s.sale_id) > 1
ORDER BY c.customer_id;

-- ============================================================
-- Task 5 : Customer Segmentation
-- Output : customer_name, total_spend, segment
-- ============================================================
PRINT 'Task 5 : Customer Segmentation';
PRINT 'Displaying Customer Segments (Gold, Silver, Bronze)';
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_amount) AS total_spend,

    CASE
        WHEN SUM(s.total_amount) > 10000 THEN 'Gold'
        WHEN SUM(s.total_amount) BETWEEN 5000 AND 10000 THEN 'Silver'
        ELSE 'Bronze'
    END AS segment

FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name

ORDER BY c.customer_id;

-- ============================================================
-- Task 6 : Final Reporting Table
-- Output :
-- customer_name, city, total_spend,
-- order_count, segment
-- ============================================================
PRINT 'Task 6 : Final Reporting Table';
PRINT 'Displaying Customer Analytics Report';
SELECT

    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,

    SUM(s.total_amount) AS total_spend,

    COUNT(s.sale_id) AS order_count,

    CASE
        WHEN SUM(s.total_amount) > 10000 THEN 'Gold'
        WHEN SUM(s.total_amount) BETWEEN 5000 AND 10000 THEN 'Silver'
        ELSE 'Bronze'
    END AS segment

FROM Customers c

INNER JOIN Sales s
ON c.customer_id = s.customer_id

GROUP BY

    c.customer_id,
    c.first_name,
    c.last_name,
    c.city

ORDER BY c.customer_id;

-- ============================================================
-- Task 7 : Save Output
-- Save the Final Report into a New Table
-- ============================================================

PRINT 'Task 7 : Save Output';
PRINT 'Saving the Final Report into Final_Report Table';


IF OBJECT_ID('dbo.Final_Report', 'U') IS NOT NULL
    DROP TABLE dbo.Final_Report;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    SUM(s.total_amount) AS total_spend,
    COUNT(s.sale_id) AS order_count,

    CASE
        WHEN SUM(s.total_amount) > 10000 THEN 'Gold'
        WHEN SUM(s.total_amount) BETWEEN 5000 AND 10000 THEN 'Silver'
        ELSE 'Bronze'
    END AS segment

INTO dbo.Final_Report

FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city;

PRINT 'Displaying Final_Report Table';

SELECT *
FROM dbo.Final_Report;
-- ============================================================
-- Display the Saved Final Report
-- ============================================================

SELECT *
FROM Final_Report;

