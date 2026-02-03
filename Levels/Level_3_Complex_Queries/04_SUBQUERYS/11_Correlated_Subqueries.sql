-- == ======================================================
-- NOTE: Performance Warning ⚠️
-- As you noted in your file description, these can be slow.
-- Normal Subquery: Runs 1 time.
-- Correlated Subquery: Runs $N$ times (where $N$ is the number of rows in the outer table).
-- If your table has 1 million rows, the subquery runs 1 million times! In those cases, 
-- a JOIN or a Window Function is usually a better choice.
-- == ======================================================
-- Practical Example
-- == ======================================================
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10, 2)
);
INSERT INTO employees VALUES 
(1, 'Ahmed', 1, 5000), (2, 'Sara', 1, 7000), -- IT (Avg: 6000)
(3, 'Ali',   2, 3000), (4, 'Mona', 2, 8000), -- Sales (Avg: 5500)
(5, 'Omar',  1, 4000);

-- -- ------------------------------------------------------
-- The Correlated Subquery
SELECT name, dept_id, salary
FROM employees AS e_outer
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees AS e_inner
    WHERE e_inner.dept_id = e_outer.dept_id -- This links them!
);
-- +------+---------+---------+
-- | name | dept_id | salary  |
-- +------+---------+---------+
-- | Sara |       1 | 7000.00 |
-- | Mona |       2 | 8000.00 |
-- +------+---------+---------+
-- -- ------------------------------------------------------
-- How it executes (Step-by-Step)
-- 1. MySQL looks at the first row (Ahmed, Dept 1, 5000).
-- 2. It takes dept_id = 1 and passes it into the subquery.
-- 3. The subquery calculates the average for Dept 1 only ($5000+7000+4000 / 3 = 5333$).
-- 4. It checks: Is $5000 > 5333$? No.
-- 5. MySQL moves to the next row (Sara) and repeats the calculation for Dept 1.
-- 6 Is $7000 > 5333$? Yes! (Sara is included).
