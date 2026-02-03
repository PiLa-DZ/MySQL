-- == ORDER BY =============================================
-- Sort all users by last_name
SELECT * FROM users ORDER BY last_name;

-- Reverse Sort
SELECT * FROM users ORDER BY last_name DESC;

-- Sort all users by (first_name, last_name) column
-- If 2 column is the same first_name sort by last_name column
SELECT * FROM users ORDER BY first_name, last_name;

-- ASC   (Ascending): The default.  1 to 10, A to Z, Oldest Date to Newest Date.
-- DESC (Descending): The opposite. 10 to 1, Z to A, Newest Date to Oldest Date.
SELECT * FROM users ORDER BY last_name ASC;

-- == Simple Example =======================================
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
insert into users (name) values 
('b'),
('e'),
('1'),
('d'), 
('10'), 
('c'), 
('4'),
('a'); 
-- -- ------------------------------------------------------
select name from users order by name asc
-- +------+
-- | name |
-- +------+
-- | 1    |
-- | 10   |
-- | 4    |
-- | a    |
-- | b    |
-- | c    |
-- | d    |
-- | e    |
-- +------+
