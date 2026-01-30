-- NOTE: If the subquery returns no rows, ALL is always TRUE. 
--       (Mathematically, a condition is true for all members of an empty set).
-- NOTE: If the subquery returns even one NULL, 
--       and the comparison fails for the other numbers, 
--       ALL becomes Unknown, and you get 0 results.
-- It's Like MAX()
-- == ======================================================
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);
INSERT INTO products (name, category, price) VALUES 
-- Stationery prices range from $5 to $20
('Pen',            'Stationery', 5.00),
('Notebook',       'Stationery', 15.00),
('Desk Organizer', 'Stationery', 20.00),
-- Electronics prices range from $12 to $150
('USB Cable',           'Electronics', 12.00),
('Gaming Mouse',        'Electronics', 45.00),
('Mechanical Keyboard', 'Electronics', 150.00);

-- -- ------------------------------------------------------
-- "Find Electronics that are more expensive than ALL Stationery items"
SELECT name, category, price
FROM products
WHERE category = 'Electronics'
AND price > ALL (
    SELECT price 
    FROM products 
    WHERE category = 'Stationery'
);
-- +---------------------+-------------+--------+
-- | name                | category    | price  |
-- +---------------------+-------------+--------+
-- | Gaming Mouse        | Electronics |  45.00 |
-- | Mechanical Keyboard | Electronics | 150.00 |
-- +---------------------+-------------+--------+
