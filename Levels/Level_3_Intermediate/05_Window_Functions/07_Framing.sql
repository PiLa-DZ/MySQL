-- The Scenario: 3-Day Moving Average
-- == ======================================================
DROP TABLE IF EXISTS daily_sales;
CREATE TABLE daily_sales (
    sale_date DATE PRIMARY KEY,
    amount DECIMAL(10, 2)
);

INSERT INTO daily_sales VALUES 
('2024-01-01', 100.00),
('2024-01-02', 200.00),
('2024-01-03', 300.00),
('2024-01-04', 100.00),
('2024-01-05', 500.00),
('2024-01-06', 200.00);

-- Calculate a 3-Day Moving Average
-- (Current Day + 2 Days Before)
SELECT 
    sale_date,
    amount,
    AVG(amount) OVER (
        ORDER BY sale_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS 3_day_moving_avg
FROM daily_sales;
-- +------------+--------+------------------+
-- | sale_date  | amount | 3_day_moving_avg |
-- +------------+--------+------------------+
-- | 2024-01-01 | 100.00 |       100.000000 |
-- | 2024-01-02 | 200.00 |       150.000000 |
-- | 2024-01-03 | 300.00 |       200.000000 |
-- | 2024-01-04 | 100.00 |       200.000000 |
-- | 2024-01-05 | 500.00 |       300.000000 |
-- | 2024-01-06 | 200.00 |       266.666667 |
-- +------------+--------+------------------+
-- == ======================================================
-- How the "Frame" Moves
-- Look at what happens on January 4th:
-- 1. The ORDER BY sorts the dates.
-- 2. The ROWS BETWEEN 2 PRECEDING AND CURRENT ROW finds the rows for Jan 2nd, Jan 3rd, and Jan 4th.
-- 3. It adds $(200 + 300 + 100) / 3 = 200.00$.
-- 4. When it moves to Jan 5th, the window "slides" down, dropping Jan 2nd and picking up Jan 5th.
