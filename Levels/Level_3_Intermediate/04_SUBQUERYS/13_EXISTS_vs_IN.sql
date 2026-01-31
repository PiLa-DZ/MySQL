-- == ======================================================
-- The Logic Difference
-- IN --> is Value-based: 
--    It looks at the values returned by the subquery 
--    and checks if a specific value exists in that list.
-- EXISTS --> is Boolean-based: 
--    It doesn't care about the data;
--    it only cares if the subquery returns at least one row.
-- == ======================================================
-- Practical Comparison Example
-- Let's find all Departments that have at least one Employee.
DROP TABLE IF EXISTS employees, departments;
CREATE TABLE departments ( id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE employees ( id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), salary DECIMAL(10, 2), dept_id INT, CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(id) ON DELETE RESTRICT);
INSERT INTO departments (id, name) VALUES (1, 'Engineering'), (2, 'Design'), (3, 'Marketing'), (4, 'Human Resources');
INSERT INTO employees (name, salary, dept_id) VALUES ('Ahmed',  1700.00, 1),   ('Sara',   3800.00, 1),    ('Khaled', 5900.00, 2),  ('Laila',  8300.00, 3),   ('Omar',  13000.00, NULL); 
-- -- ------------------------------------------------------
-- Using IN
SELECT name FROM departments 
WHERE id IN (SELECT dept_id FROM employees);
-- +-------------+
-- | name        |
-- +-------------+
-- | Engineering |
-- | Design      |
-- | Marketing   |
-- +-------------+
-- How it works
-- MySQL runs the inner query and builds a list/set of all dept_ids.
-- It then scans the departments table and checks if each ID is in that list.
-- -- ------------------------------------------------------
-- Using EXISTS
SELECT name FROM departments d
WHERE EXISTS ( SELECT 1 FROM employees e WHERE e.dept_id = d.id);
-- +-------------+
-- | name        |
-- +-------------+
-- | Engineering |
-- | Design      |
-- | Marketing   |
-- +-------------+
-- How it works
-- MySQL starts scanning the departments table.
-- For each department, it looks into the employees table.
-- The "Short-Circuit": As soon as it finds one employee for that department, 
-- it stops looking and returns TRUE. 
-- It doesn't check the rest of the employees for that specific department.
