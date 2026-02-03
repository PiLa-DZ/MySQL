-- == Simple Example 1 =====================================
DROP TABLE IF EXISTS users;
DROP VIEW  IF EXISTS users_view;
CREATE TABLE users ( id INT, name VARCHAR(100));
INSERT INTO  users (id, name) VALUES 
(1, 'e'), (2, 'a'), (3, 'c'), (4, 'd'), (5, 'e');
-- -- ------------------------------------------------------
-- Create VIEW
CREATE VIEW users_view AS SELECT * FROM users;
-- Show VIEW
SELECT * FROM users_view;
-- +------+------+
-- | id   | name |
-- +------+------+
-- |    1 | e    |
-- |    2 | a    |
-- |    3 | c    |
-- |    4 | d    |
-- |    5 | e    |
-- +------+------+
