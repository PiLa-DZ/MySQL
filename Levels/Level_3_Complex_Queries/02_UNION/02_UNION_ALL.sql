-- == More about UNION =====================================
-- Join 2 Tables with (first_name, last_name) --------------
-- Include Doublacated -------------------------------------
SELECT first_name, last_name FROM users
UNION ALL
SELECT first_name, last_name FROM workers;

-- == Simple Example =======================================
DROP TABLE IF EXISTS a, b;
CREATE TABLE a (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
insert into a (name) values ('a'), ('b'), ('c'); 
CREATE TABLE b (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
insert into b (name) values ('a'), ('b'), ('d'); 
-- -- ------------------------------------------------------
select * from a
union all
select * from b; 
-- +----+------+
-- | id | name |
-- +----+------+
-- |  1 | a    |
-- |  2 | b    |
-- |  3 | c    |
-- |  1 | a    |
-- |  2 | b    |
-- |  3 | d    |
-- +----+------+
