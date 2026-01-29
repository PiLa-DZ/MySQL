-- == FULL OUTPUT JOIN (UNION) =============================
SELECT e.name, d.name FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id
UNION
SELECT e.name, d.name FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.id;

-- print just NULL values ----------------------------------
SELECT e.name, d.name FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id
WHERE d.id IS NULL
UNION
SELECT e.name, d.name FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.id
WHERE e.id IS NULL;

-- ERORR: It Don't work with deferant amount of Rows -------

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
union
select * from b; 
-- +----+------+
-- | id | name |
-- +----+------+
-- |  1 | a    |
-- |  2 | b    |
-- |  3 | c    |
-- |  3 | d    |
-- +----+------+
