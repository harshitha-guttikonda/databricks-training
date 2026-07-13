-- ============================================================
-- Task 1 : Daily Sales
-- ============================================================

SELECT
    sale_date,
    SUM(total_amount) AS daily_sales
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;



-- ============================================================
-- Task 2 : City-wise Revenue
-- ============================================================

SELECT
    c.city,
    SUM(s.total_amount) AS total_revenue
FROM Customers c
INNER JOIN Sales s
ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;


-- ============================================================
-- Task 3 : Repeat Customers (>2 Orders)
-- ============================================================

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
HAVING COUNT(s.sale_id) > 2;



-- ============================================================
-- Task 4 : Highest Spending Customer in Each City
-- ============================================================

WITH CustomerSpend AS
(
    SELECT
        c.city,
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(s.total_amount) AS total_spend,
        ROW_NUMBER() OVER
        (
            PARTITION BY c.city
            ORDER BY SUM(s.total_amount) DESC
        ) AS rn
    FROM Customers c
    INNER JOIN Sales s
    ON c.customer_id = s.customer_id
    GROUP BY
        c.city,
        c.customer_id,
        c.first_name,
        c.last_name
)

SELECT
    city,
    customer_id,
    first_name,
    last_name,
    total_spend
FROM CustomerSpend
WHERE rn = 1;



-- ============================================================
-- Task 5 : Final Reporting Table
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    SUM(s.total_amount) AS total_spend,
    COUNT(s.sale_id) AS order_count
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
-- Display Customers
-- ============================================================

SELECT * FROM Customers;

-- ============================================================
-- Display Sales
-- ============================================================

SELECT * FROM Sales;