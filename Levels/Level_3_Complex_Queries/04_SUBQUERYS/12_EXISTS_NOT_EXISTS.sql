-- == EXISTS_NOT_EXISTS.sql ================================
DROP TABLE IF EXISTS users, orders;
CREATE TABLE users (id INT PRIMARY KEY, name VARCHAR(50));
CREATE TABLE orders (id INT PRIMARY KEY, user_id INT, amount DECIMAL(10,2));
INSERT INTO users VALUES (1, 'Ahmed'), (2, 'Sara'), (3, 'Ali');
INSERT INTO orders VALUES (101, 1, 50.00), (102, 1, 30.00), (103, 2, 100.00);

-- -- ------------------------------------------------------
-- 1. EXISTS: "Find users who are active (have at least one order)"
SELECT name 
FROM users u
WHERE EXISTS (
    SELECT 1 
    FROM orders o 
    WHERE o.user_id = u.id -- This correlation is the "bridge"
);
-- +-------+
-- | name  |
-- +-------+
-- | Ahmed |
-- | Sara  |
-- +-------+
-- -- ------------------------------------------------------
-- 2. NOT EXISTS: "Find users who have NEVER placed an order"
SELECT name 
FROM users u
WHERE NOT EXISTS (
    SELECT 1 
    FROM orders o 
    WHERE o.user_id = u.id
);
-- +------+
-- | name |
-- +------+
-- | Ali  |
-- +------+
