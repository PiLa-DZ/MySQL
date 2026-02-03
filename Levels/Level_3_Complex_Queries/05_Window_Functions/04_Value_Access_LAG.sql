-- Value Access: LAG() and LEAD() 
-- "Look-back" and "Look-ahead" functions.
-- == ======================================================
DROP TABLE IF EXISTS monthly_revenue;
CREATE TABLE monthly_revenue (
    month_id INT PRIMARY KEY,
    revenue DECIMAL(10, 2)
);
INSERT INTO monthly_revenue VALUES 
(1, 10000.00), -- Jan
(2, 12000.00), -- Feb
(3, 11000.00), -- Mar
(4, 15000.00); -- Apr

-- LAG(column, offset, default_value)
SELECT 
    month_id,
    revenue AS current_month,
    COALESCE(LAG(revenue, 1) OVER (ORDER BY month_id), 0.00) AS previous_month,
    revenue - COALESCE(LAG(revenue, 1) OVER (ORDER BY month_id), 0.00) AS revenue_diff
FROM monthly_revenue;
-- +----------+---------------+----------------+--------------+
-- | month_id | current_month | previous_month | revenue_diff |
-- +----------+---------------+----------------+--------------+
-- |        1 |      10000.00 |           0.00 |     10000.00 |
-- |        2 |      12000.00 |       10000.00 |      2000.00 |
-- |        3 |      11000.00 |       12000.00 |     -1000.00 |
-- |        4 |      15000.00 |       11000.00 |      4000.00 |
-- +----------+---------------+----------------+--------------+
