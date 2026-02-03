-- == ======================================================
-- Why use NTILE?
-- 1. Marketing:          Automatically finding the "Top 10%" (NTILE(10)) of users for an email campaign.
-- 2. Performance Review: Grading employees or students on a curve (e.g., A, B, C, D).
-- 3. Data Analysis:      Comparing the average behavior of the "lowest spenders" vs. "highest spenders."
-- == ======================================================
DROP TABLE IF EXISTS customer_spending;
CREATE TABLE customer_spending (
    customer_name VARCHAR(50),
    total_spent DECIMAL(10, 2)
);

INSERT INTO customer_spending VALUES 
('Ahmed', 500.00), ('Sara', 1500.00), ('Ali', 200.00), 
('Mona', 5000.00), ('Omar', 3500.00), ('Laila', 100.00),
('Zaid', 2500.00), ('Huda', 4000.00);

-- Divide customers into 4 quartiles based on spending
SELECT 
    customer_name,
    total_spent,
    NTILE(4) OVER (ORDER BY total_spent DESC) AS quartile
FROM customer_spending;
-- +---------------+-------------+----------+
-- | customer_name | total_spent | quartile |
-- +---------------+-------------+----------+
-- | Mona          |     5000.00 |        1 |
-- | Huda          |     4000.00 |        1 |
-- | Omar          |     3500.00 |        2 |
-- | Zaid          |     2500.00 |        2 |
-- | Sara          |     1500.00 |        3 |
-- | Ahmed         |      500.00 |        3 |
-- | Ali           |      200.00 |        4 |
-- | Laila         |      100.00 |        4 |
-- +---------------+-------------+----------+
-- == ======================================================
-- More Explain
-- Mona,  | 5000.00, | 1, | Top 25%
-- Huda,  | 4000.00, | 1, | Top 25%
-- Omar,  | 3500.00, | 2, | High-Mid
-- Zaid,  | 2500.00, | 2, | High-Mid
-- Sara,  | 1500.00, | 3, | Low-Mid
-- Ahmed, | 500.00,  | 3, | Low-Mid
-- Ali,   | 200.00,  | 4, | Bottom 25%
-- Laila, | 100.00,  | 4, | Bottom 25%
-- == ======================================================
