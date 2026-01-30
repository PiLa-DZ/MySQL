-- Using a Columnar Subquery with IN
-- == ======================================================
DROP TABLE IF EXISTS employees, departments;
CREATE TABLE departments ( 
    id INT PRIMARY KEY, 
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL
);
INSERT INTO departments (id, name, city) VALUES 
(1, 'Engineering', "California"), 
(2, 'Design', "New York"), 
(3, 'Marketing', "Los Angeles"), 
(4, 'Human Resources', "Chicago");
CREATE TABLE employees ( id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), salary DECIMAL(10, 2), dept_id INT, CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(id) ON DELETE RESTRICT);
INSERT INTO employees (name, salary, dept_id) VALUES 
('Ahmed',  1700.00, 1),   
('Sara',   3800.00, 1),    
('Khaled', 5900.00, 2),  
('Laila',  8300.00, 3),   
('Omar',  13000.00, NULL); 

-- Find employees who work in departments located in 'California'
SELECT name AS All_Employees_From_California
FROM employees 
WHERE dept_id IN (SELECT id FROM departments WHERE city = 'California');
-- +-------------------------------+
-- | All_Employees_From_California |
-- +-------------------------------+
-- | Ahmed                         |
-- | Sara                          |
-- +-------------------------------+
