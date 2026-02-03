-- CTEs (Common Table Expressions)
-- NOTE: (it's not saved in the database).
-- From "Messy Subquery" to "Clean CTE"
-- == ======================================================
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    salary DECIMAL(10, 2)
);
INSERT INTO employees (name, dept_name, salary) VALUES 
('Ahmed', 'IT', 5000), ('Sara', 'IT', 7000),
('Ali', 'Sales', 3000), ('Mona', 'Sales', 4000),
('Omar', 'HR', 2500);

-- -- ------------------------------------------------------
WITH Department_Averages AS (
    SELECT 
        dept_name, 
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_name
)
SELECT AVG(avg_salary) AS Global_Average FROM Department_Averages;
-- +-----------------+
-- | Global_Average  |
-- +-----------------+
-- | 4000.0000000000 |
-- +-----------------+
