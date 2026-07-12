use Retaildb;
-- ============================================================
-- Phase 4A : Bucketing & Segmentation
-- ============================================================

PRINT 'Displaying Customers Table';

SELECT *
FROM Customers;

PRINT 'Displaying Sales Table';

SELECT *
FROM Sales;

-- ============================================================
-- Calculate Total Spend Per Customer
-- ============================================================

PRINT 'Displaying Customer Total Spend';

SELECT
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
ORDER BY c.customer_id;

-- ============================================================
-- Task 1 : Customer Segmentation
-- Using CASE Statement
-- ============================================================

PRINT 'Task 1 : Customer Segmentation';

SELECT

    c.customer_id,
    c.first_name,
    c.last_name,

    SUM(s.total_amount) AS total_spend,

    CASE

        WHEN SUM(s.total_amount) > 10000
        THEN 'Gold'

        WHEN SUM(s.total_amount) BETWEEN 5000 AND 10000
        THEN 'Silver'

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
-- Task 2 : Count Customers by Segment
-- ============================================================

PRINT 'Task 2 : Customer Count by Segment';

SELECT

    segment,
    COUNT(*) AS customer_count

FROM
(
    SELECT

        CASE

            WHEN SUM(total_amount) > 10000
            THEN 'Gold'

            WHEN SUM(total_amount) BETWEEN 5000 AND 10000
            THEN 'Silver'

            ELSE 'Bronze'

        END AS segment

    FROM Sales

    GROUP BY customer_id

) AS CustomerSegments

GROUP BY segment;

-- ============================================================
-- Task 3 : Quantile-based Segmentation
-- ============================================================

PRINT 'Task 3 : Quantile-based Segmentation';

WITH CustomerSpend AS
(
    SELECT

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
)

SELECT

    customer_id,
    first_name,
    last_name,
    total_spend,

    CASE NTILE(3) OVER(ORDER BY total_spend)

        WHEN 1 THEN 'Bronze'
        WHEN 2 THEN 'Silver'
        WHEN 3 THEN 'Gold'

    END AS segment

FROM CustomerSpend

ORDER BY customer_id;

-- ============================================================
-- Task 4 : Fixed Threshold Method
-- ============================================================

PRINT 'Task 4 : Fixed Threshold Segmentation';

SELECT

    segment,
    COUNT(*) AS customer_count

FROM
(
    SELECT

        CASE

            WHEN SUM(total_amount) > 10000
            THEN 'Gold'

            WHEN SUM(total_amount) BETWEEN 5000 AND 10000
            THEN 'Silver'

            ELSE 'Bronze'

        END AS segment

    FROM Sales

    GROUP BY customer_id

) AS Segments

GROUP BY segment;


-- ============================================================
-- Task 4 : Quantile Method
-- ============================================================

PRINT 'Task 4 : Quantile-based Segmentation';

WITH CustomerSpend AS
(
    SELECT

        customer_id,

        SUM(total_amount) AS total_spend

    FROM Sales

    GROUP BY customer_id
)

SELECT

    segment,
    COUNT(*) AS customer_count

FROM
(
    SELECT

        CASE NTILE(3) OVER(ORDER BY total_spend)

            WHEN 1 THEN 'Bronze'
            WHEN 2 THEN 'Silver'
            WHEN 3 THEN 'Gold'

        END AS segment

    FROM CustomerSpend

) AS QuantileSegments

GROUP BY segment;


-- ============================================================
-- Reflection
-- ============================================================

PRINT 'Reflection Questions';

PRINT '1. Bucketing converts continuous values into categories for easier analysis.';
PRINT '2. Business segmentation uses business rules, whereas technical bucketing uses data distribution.';
PRINT '3. Fixed thresholds may fail when data changes significantly.';
PRINT '4. Quantile-based segmentation divides data into equal-sized groups.';
PRINT '5. In real-world projects, quantile-based segmentation is often preferred because it adapts to changing data.';use Retaildb;
-- ============================================================
-- Phase 4A : Bucketing & Segmentation
-- ============================================================

PRINT 'Displaying Customers Table';

SELECT *
FROM Customers;

PRINT 'Displaying Sales Table';

SELECT *
FROM Sales;

-- ============================================================
-- Calculate Total Spend Per Customer
-- ============================================================

PRINT 'Displaying Customer Total Spend';

SELECT
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
ORDER BY c.customer_id;

-- ============================================================
-- Task 1 : Customer Segmentation
-- Using CASE Statement
-- ============================================================

PRINT 'Task 1 : Customer Segmentation';

SELECT

    c.customer_id,
    c.first_name,
    c.last_name,

    SUM(s.total_amount) AS total_spend,

    CASE

        WHEN SUM(s.total_amount) > 10000
        THEN 'Gold'

        WHEN SUM(s.total_amount) BETWEEN 5000 AND 10000
        THEN 'Silver'

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
-- Task 2 : Count Customers by Segment
-- ============================================================

PRINT 'Task 2 : Customer Count by Segment';

SELECT

    segment,
    COUNT(*) AS customer_count

FROM
(
    SELECT

        CASE

            WHEN SUM(total_amount) > 10000
            THEN 'Gold'

            WHEN SUM(total_amount) BETWEEN 5000 AND 10000
            THEN 'Silver'

            ELSE 'Bronze'

        END AS segment

    FROM Sales

    GROUP BY customer_id

) AS CustomerSegments

GROUP BY segment;

-- ============================================================
-- Task 3 : Quantile-based Segmentation
-- ============================================================

PRINT 'Task 3 : Quantile-based Segmentation';

WITH CustomerSpend AS
(
    SELECT

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
)

SELECT

    customer_id,
    first_name,
    last_name,
    total_spend,

    CASE NTILE(3) OVER(ORDER BY total_spend)

        WHEN 1 THEN 'Bronze'
        WHEN 2 THEN 'Silver'
        WHEN 3 THEN 'Gold'

    END AS segment

FROM CustomerSpend

ORDER BY customer_id;

-- ============================================================
-- Task 4 : Fixed Threshold Method
-- ============================================================

PRINT 'Task 4 : Fixed Threshold Segmentation';

SELECT

    segment,
    COUNT(*) AS customer_count

FROM
(
    SELECT

        CASE

            WHEN SUM(total_amount) > 10000
            THEN 'Gold'

            WHEN SUM(total_amount) BETWEEN 5000 AND 10000
            THEN 'Silver'

            ELSE 'Bronze'

        END AS segment

    FROM Sales

    GROUP BY customer_id

) AS Segments

GROUP BY segment;


-- ============================================================
-- Task 4 : Quantile Method
-- ============================================================

PRINT 'Task 4 : Quantile-based Segmentation';

WITH CustomerSpend AS
(
    SELECT

        customer_id,

        SUM(total_amount) AS total_spend

    FROM Sales

    GROUP BY customer_id
)

SELECT

    segment,
    COUNT(*) AS customer_count

FROM
(
    SELECT

        CASE NTILE(3) OVER(ORDER BY total_spend)

            WHEN 1 THEN 'Bronze'
            WHEN 2 THEN 'Silver'
            WHEN 3 THEN 'Gold'

        END AS segment

    FROM CustomerSpend

) AS QuantileSegments

GROUP BY segment;


-- ============================================================
-- Reflection
-- ============================================================

PRINT 'Reflection Questions';

PRINT '1. Bucketing converts continuous values into categories for easier analysis.';
PRINT '2. Business segmentation uses business rules, whereas technical bucketing uses data distribution.';
PRINT '3. Fixed thresholds may fail when data changes significantly.';
PRINT '4. Quantile-based segmentation divides data into equal-sized groups.';
PRINT '5. In real-world projects, quantile-based segmentation is often preferred because it adapts to changing data.';