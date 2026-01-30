-- Find departments that actually have at least one employee
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

-- Find departments that actually have at least one employee
SELECT name 
FROM departments d
WHERE EXISTS (
    SELECT 1 
    FROM employees e 
    WHERE e.dept_id = d.id
);
-- +-------------+
-- | name        |
-- +-------------+
-- | Engineering |
-- | Design      |
-- | Marketing   |
-- +-------------+
