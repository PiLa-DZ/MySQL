-- Example: Rank employees by salary within their own department.
-- == ======================================================
DROP TABLE IF EXISTS employees, departments;
CREATE TABLE departments ( id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE employees ( id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), salary DECIMAL(10, 2), dept_id INT, CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(id) ON DELETE RESTRICT);
INSERT INTO departments (id, name) VALUES (1, 'Engineering'), (2, 'Design'), (3, 'Marketing'), (4, 'Human Resources');
INSERT INTO employees (name, salary, dept_id) VALUES ('Ahmed',  1700.00, 1),   ('Sara',   3800.00, 1),    ('Khaled', 5900.00, 2),  ('Laila',  8300.00, 3),   ('Omar',  13000.00, NULL); 
-- == 02_Partition_By.sql ===================================
SELECT name, dept_id, salary,
    ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS dept_rank
FROM employees;
-- +--------+---------+----------+-----------+
-- | name   | dept_id | salary   | dept_rank |
-- +--------+---------+----------+-----------+
-- | Omar   |    NULL | 13000.00 |         1 |
-- | Sara   |       1 |  3800.00 |         1 |
-- | Ahmed  |       1 |  1700.00 |         2 |
-- | Khaled |       2 |  5900.00 |         1 |
-- | Laila  |       3 |  8300.00 |         1 |
-- +--------+---------+----------+-----------+
