-- == Advanced Example 2 ================================
-- If you update (VIEW) it also will be update (original table)
DROP VIEW IF EXISTS users_greater_than_18;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT auto_increment primary key,
    name VARCHAR(50),
    age INT
);
INSERT INTO users (name, age) VALUES
("Sara", 9), ("Ali", 24), ("Mona", 33), ("Adem", 13), ("Amir", 18);

-- -- ------------------------------------------------------
CREATE VIEW users_greater_than_18 AS
SELECT * FROM users WHERE age >= 18;

-- -- ------------------------------------------------------
system echo "-- == (Before Update =======================================";
SELECT * FROM users WHERE name = "Amir";
-- +----+------+------+
-- | id | name | age  |
-- +----+------+------+
-- |  5 | Amir |   18 |
-- +----+------+------+
SELECT * FROM users_greater_than_18 WHERE name = "Amir";
-- +----+------+------+
-- | id | name | age  |
-- +----+------+------+
-- |  5 | Amir |   18 |
-- +----+------+------+

-- If you update (VIEW) it also will be update (original table)
UPDATE users_greater_than_18 SET age = 20 WHERE name = 'Amir';

system echo "-- == (After Update) =======================================";
SELECT * FROM users WHERE name = "Amir";
-- +----+------+------+
-- | id | name | age  |
-- +----+------+------+
-- |  5 | Amir |   20 |
-- +----+------+------+
SELECT * FROM users_greater_than_18 WHERE name = "Amir";
-- +----+------+------+
-- | id | name | age  |
-- +----+------+------+
-- |  5 | Amir |   20 |
-- +----+------+------+
