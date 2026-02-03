-- == Simple Example 2 =====================================
DROP TABLE IF EXISTS users;
DROP VIEW  IF EXISTS users_view;
CREATE TABLE users ( id INT, name VARCHAR(100));
INSERT INTO  users (id, name) VALUES 
(1, 'e'), (2, 'a'), (3, 'c'), (4, 'd'), (5, 'e');
-- -- ------------------------------------------------------
-- If you update (VIEW) it also will be update (original table)
CREATE VIEW users_view AS SELECT * FROM users; -- Create VIEW
UPDATE users_view SET name = "Ani" WHERE id = 1; -- Update VIEW
SELECT * FROM users; -- Show Original TABLE
-- +------+------+
-- | id   | name |
-- +------+------+
-- |    1 | Ani  |
-- |    2 | a    |
-- |    3 | c    |
-- |    4 | d    |
-- |    5 | e    |
-- +------+------+
