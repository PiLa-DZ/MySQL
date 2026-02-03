-- == Example 2 ============================================
-- == Get the total of the totals ==========================
DROP TABLE IF EXISTS employees, departments;
CREATE TABLE departments ( id INT PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE employees ( id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), salary DECIMAL(10, 2), dept_id INT, CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(id) ON DELETE RESTRICT);
INSERT INTO departments (id, name) VALUES (1, 'Engineering'), (2, 'Design'), (3, 'Marketing'), (4, 'Human Resources');
INSERT INTO employees (name, salary, dept_id) VALUES ('Ahmed',  1700.00, 1),   ('Sara',   3800.00, 1),    ('Khaled', 5900.00, 2),  ('Laila',  8300.00, 3),   ('Omar',  13000.00, NULL); 

-- -- ------------------------------------------------------
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

