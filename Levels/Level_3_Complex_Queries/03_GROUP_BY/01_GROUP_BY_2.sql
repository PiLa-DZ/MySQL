-- == Advanced Example 1 ===================================
-- Count how many employees we have in each departments ----
DROP TABLE IF EXISTS employees, departments;
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
INSERT INTO departments (id, name) VALUES 
(1, 'Engineering'),
(2, 'Design'),
(3, 'Marketing'),
(4, 'Human Resources');
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
	salary DECIMAL(10, 2),
    dept_id INT,
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) 
    REFERENCES departments(id) ON DELETE RESTRICT
);
INSERT INTO employees (name, salary, dept_id) VALUES 
('Ahmed',  1700.00, 1),   
('Sara',   3800.00, 1),    
('Laila',  8300.00, 3),   
('Ana',    2300.00, 1),   
('Khaled', 5900.00, 2),  
('Ari',    5300.00, 3),   
('Omar',  13000.00, NULL); 
-- -- ------------------------------------------------------
SELECT 
    d.name      AS Department, 
    COUNT(e.id) AS Total_Emplyees
FROM departments d
LEFT JOIN employees e 
ON d.id = e.dept_id
GROUP BY d.id;
-- +-----------------+----------------+
-- | Department      | Total_Emplyees |
-- +-----------------+----------------+
-- | Engineering     |              3 |
-- | Design          |              1 |
-- | Marketing       |              2 |
-- | Human Resources |              0 |
-- +-----------------+----------------+
