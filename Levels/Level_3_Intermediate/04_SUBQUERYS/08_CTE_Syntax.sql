-- CTEs (Common Table Expressions)
-- NOTE: (it's not saved in the database).
-- NOTE: Scope: It only exists for the duration of that single query (it's not saved in the database).
-- The Basic Syntax
-- You define the CTE first, then you run your SELECT statement.
-- -- ------------------------------------------------------
DROP TABLE IF EXISTS users;
CREATE TABLE users (id INT, name VARCHAR(100));
INSERT INTO users (id, name) VALUES (1, 'a'), (2, 'b'), (3, 'c');

WITH My_CTE_Name AS (
    SELECT id, name
    FROM users
    WHERE id > 1
)
SELECT * FROM My_CTE_Name; -- Now you use it like a real table
-- +------+------+
-- | id   | name |
-- +------+------+
-- |    2 | b    |
-- |    3 | c    |
-- +------+------+
