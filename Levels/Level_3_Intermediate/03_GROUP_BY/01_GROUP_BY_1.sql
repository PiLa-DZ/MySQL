-- == Simple Example 0 =====================================
-- NOTE: Here we have simple table with repeated names -----
DROP TABLE IF EXISTS a; 
CREATE TABLE a (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
insert into a (name) values ('a'), ('b'), ('c'), ('a'), ('c');
-- -- ------------------------------------------------------
select * from a;
-- +----+------+
-- | id | name |
-- +----+------+
-- |  1 | a    |
-- |  2 | b    |
-- |  3 | c    |
-- |  4 | a    |
-- |  5 | c    |
-- +----+------+

-- == Simple Example 1 =====================================
DROP TABLE IF EXISTS a; 
CREATE TABLE a (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
insert into a (name) values ('a'), ('b'), ('c'), ('a'), ('c');
-- -- ------------------------------------------------------
select * from a
group by name;
-- +----+------+
-- | id | name |
-- +----+------+
-- |  1 | a    |
-- |  2 | b    |
-- |  3 | c    |
-- +----+------+

-- == Simple Example 2 =====================================
DROP TABLE IF EXISTS a; 
CREATE TABLE a (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
insert into a (name) values ('a'), ('b'), ('c'), ('a'), ('c');
-- -- ------------------------------------------------------
select *, count(name) AS Count_Repeated_Names
from a
group by name;
-- +----+------+----------------------+
-- | id | name | Count_Repeated_Names |
-- +----+------+----------------------+
-- |  1 | a    |                    2 |
-- |  2 | b    |                    1 |
-- |  3 | c    |                    2 |
-- +----+------+----------------------+
