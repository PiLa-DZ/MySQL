-- == Simple Example 1 =====================================
DROP TABLE IF EXISTS employees, departments;
CREATE TABLE departments ( id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE employees ( id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), salary DECIMAL(10, 2), dept_id INT, CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(id) ON DELETE RESTRICT);
INSERT INTO departments (id, name) VALUES (1, 'Engineering'), (2, 'Design'), (3, 'Marketing'), (4, 'Human Resources');
INSERT INTO employees (name, salary, dept_id) VALUES ('Ahmed',  1700.00, 1),   ('Sara',   3800.00, 1),    ('Khaled', 5900.00, 2),  ('Laila',  8300.00, 3),   ('Omar',  13000.00, NULL); 
SELECT 
    name AS Employee_Name,
    (SELECT name FROM departments WHERE id = employees.dept_id)
    AS Department_Name
FROM employees;
-- +---------------+-----------------+
-- | Employee_Name | Department_Name |
-- +---------------+-----------------+
-- | Ahmed         | Engineering     |
-- | Sara          | Engineering     |
-- | Khaled        | Design          |
-- | Laila         | Marketing       |
-- | Omar          | NULL            |
-- +---------------+-----------------+
