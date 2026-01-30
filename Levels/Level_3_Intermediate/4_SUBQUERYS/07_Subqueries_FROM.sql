-- == Derived Table ========================================
-- NOTE: In MySQL, every Derived Table must have its own Alias (a name). 
--       If you don't give it a name (like AS my_temp_table), 
--       MySQL will throw an error.
-- == ======================================================
-- A Real-World Example: "The Average of Averages"
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
-- 1. This Normal "Departments Average Salary"
SELECT dept_name, AVG(salary) AS dept_avg_salary
FROM employees
GROUP BY dept_name
-- +-----------+-----------------+
-- | dept_name | dept_avg_salary |
-- +-----------+-----------------+
-- | HR        |     2500.000000 |
-- | IT        |     6000.000000 |
-- | Sales     |     3500.000000 |
-- +-----------+-----------------+

-- -- ------------------------------------------------------
-- 2. The FROM Subquery (Derived Table)
-- A Real-World Example: "The Average of Averages"
SELECT AVG(dept_avg_salary) AS global_average
FROM (
    -- This inner query creates a "virtual table"
    SELECT dept_name, AVG(salary) AS dept_avg_salary
    FROM employees
    GROUP BY dept_name
) AS department_summaries; -- <--- THIS ALIAS IS MANDATORY!
-- +-----------------+
-- | global_average  |
-- +-----------------+
-- | 4000.0000000000 |
-- +-----------------+
