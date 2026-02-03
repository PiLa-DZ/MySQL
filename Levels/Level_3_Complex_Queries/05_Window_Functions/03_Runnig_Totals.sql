-- How the Logic Works
-- 1. SUM(amount): This is the calculation we want.
-- 2. OVER: This tells MySQL "Don't collapse the rows; keep them separate."
-- 3. ORDER BY sale_date, id: This is the most important part. It tells the window how to "stack" the values. It starts at the first date and adds the next amount to the previous sum.
-- == ======================================================
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sale_date DATE,
    amount DECIMAL(10, 2)
);
INSERT INTO sales (sale_date, amount) VALUES 
('2024-01-01', 100.00),
('2024-01-02', 150.00),
('2024-01-02', 50.00),  -- Multiple sales on the same day
('2024-01-03', 200.00),
('2024-01-04', 100.00);

-- The Running Total Query
SELECT 
    id,
    sale_date,
    amount,
    SUM(amount) OVER(ORDER BY sale_date, id) AS running_total
FROM sales;
-- +------+------------+--------+---------------+
-- | id   | sale_date  | amount | running_total |
-- +------+------------+--------+---------------+
-- |    1 | 2024-01-01 | 100.00 |        100.00 |
-- |    2 | 2024-01-02 | 150.00 |        250.00 |
-- |    3 | 2024-01-02 |  50.00 |        300.00 |
-- |    4 | 2024-01-03 | 200.00 |        500.00 |
-- |    5 | 2024-01-04 | 100.00 |        600.00 |
-- +------+------------+--------+---------------+
