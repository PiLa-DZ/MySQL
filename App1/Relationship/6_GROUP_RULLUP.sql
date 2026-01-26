-- == Example 1 ============================================
-- == Get the tatal of the totals ==========================
DROP TABLE IF EXISTS sales;
CREATE TABLE sales ( brand VARCHAR(50), amount DECIMAL(10, 2));
INSERT INTO sales (brand, amount) VALUES 
('Apple', 1200), ('Apple', 800), ('Samsung', 1100), ('Samsung', 400);

SELECT brand, SUM(amount) AS total FROM sales
GROUP BY brand WITH ROLLUP;
-- +---------+---------+
-- | brand   | total   |
-- +---------+---------+
-- | Apple   | 2000.00 | -- Price
-- | Samsung | 1500.00 | -- Price
-- | NULL    | 3500.00 | -- All Total
-- +---------+---------+

-- == Example 2 ============================================
-- == Get the tatal of the totals ==========================
DROP TABLE IF EXISTS employees, departments;
CREATE TABLE departments ( id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE employees ( id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), salary DECIMAL(10, 2), dept_id INT, CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(id) ON DELETE RESTRICT);
INSERT INTO departments (id, name) VALUES (1, 'Engineering'), (2, 'Design'), (3, 'Marketing'), (4, 'Human Resources');
INSERT INTO employees (name, salary, dept_id) VALUES ('Ahmed',  1700.00, 1),   ('Sara',   3800.00, 1),    ('Khaled', 5900.00, 2),  ('Laila',  8300.00, 3),   ('Omar',  13000.00, NULL); 

system clear;
select 
    d.name as Departmen, 
    sum(e.salary) as total_emps_salary
from departments d
join employees e
on d.id = e.dept_id
group by d.id with rollup; 
-- +-------------+-------------------+
-- | Departmen   | total_emps_salary |
-- +-------------+-------------------+
-- | Engineering |           5500.00 | -- Total salary
-- | Design      |           5900.00 | -- Total salary
-- | Marketing   |           8300.00 | -- Total salary
-- | Marketing   |          19700.00 | -- All Total salary
-- +-------------+-------------------+

-- == Example 3 ============================================
-- == Solve the NULL problem ===============================
-- == Using (COALESCE) =====================================
DROP TABLE IF EXISTS employees, departments;
CREATE TABLE departments ( id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE employees ( id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), salary DECIMAL(10, 2), dept_id INT, CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(id) ON DELETE RESTRICT);
INSERT INTO departments (id, name) VALUES (1, 'Engineering'), (2, 'Design'), (3, 'Marketing'), (4, 'Human Resources');
INSERT INTO employees (name, salary, dept_id) VALUES ('Ahmed',  1700.00, 1),   ('Sara',   3800.00, 1),    ('Khaled', 5900.00, 2),  ('Laila',  8300.00, 3),   ('Omar',  13000.00, NULL); 

system clear;
SELECT 
    COALESCE(d.name, 'GRAND TOTAL') AS Department,
    SUM(e.salary) AS total_salary
FROM departments d
JOIN employees e ON d.id = e.dept_id
GROUP BY d.name WITH ROLLUP;
-- +-------------+--------------+
-- | Department  | total_salary |
-- +-------------+--------------+
-- | Design      |      5900.00 |
-- | Engineering |      5500.00 |
-- | Marketing   |      8300.00 |
-- | GRAND TOTAL |     19700.00 |
-- +-------------+--------------+
