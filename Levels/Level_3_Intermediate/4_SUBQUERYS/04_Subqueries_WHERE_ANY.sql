-- == ======================================================
-- NOTE: = ANY is exactly the same as using the IN operator.
-- It's like MIN()
-- == ======================================================
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    role VARCHAR(50),
    salary DECIMAL(10, 2)
);
-- Managers have a range of salaries from 5000 to 9000
INSERT INTO employees (name, role, salary) VALUES 
('Alice',   'Manager',   9000.00),
('Bob',     'Manager',   7000.00),
('Charlie', 'Manager',   5000.00),
('David',   'Developer', 4000.00),  -- Earns less than all managers
('Eve',     'Developer', 6000.00),  -- Earns more than Charlie (5000)
('Frank',   'Developer', 10000.00); -- Earns more than all managers

-- -- ------------------------------------------------------
-- "Find developers who earn more than ANY manager"
SELECT name, role, salary
FROM employees
WHERE role = 'Developer'
AND salary > ANY (
    SELECT salary 
    FROM employees 
    WHERE role = 'Manager'
);
-- +-------+-----------+----------+
-- | name  | role      | salary   |
-- +-------+-----------+----------+
-- | Eve   | Developer |  6000.00 |
-- | Frank | Developer | 10000.00 |
-- +-------+-----------+----------+
