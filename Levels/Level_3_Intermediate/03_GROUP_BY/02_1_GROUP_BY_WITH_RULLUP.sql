-- == Example 1 ============================================
-- == Get the tatal of the totals ==========================
DROP TABLE IF EXISTS sales;
CREATE TABLE sales ( brand VARCHAR(50), amount DECIMAL(10, 2));
INSERT INTO sales (brand, amount) VALUES 
('Apple', 1200), ('Apple', 800), ('Samsung', 1100), ('Samsung', 400);

SELECT brand, SUM(amount) AS total FROM sales
GROUP BY brand WITH ROLLUP;
-- +---------+---------+
-- | brand   | total   |
-- +---------+---------+
-- | Apple   | 2000.00 | -- Price
-- | Samsung | 1500.00 | -- Price
-- | NULL    | 3500.00 | -- All Total
-- +---------+---------+

