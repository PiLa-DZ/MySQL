-- == Example ==============================================
-- Show Departments that have less than 2 employees --------
-- +-----------------+-----------------+
-- | Department      | Total_Employees |
-- +-----------------+-----------------+
-- | Design          |               1 |
-- | Marketing       |               1 |
-- | Human Resources |               0 |
-- +-----------------+-----------------+
-- == ======================================================
DROP TABLE IF EXISTS employees, departments;
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
	salary DECIMAL(10, 2),
    dept_id INT,
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) 
    REFERENCES departments(id) ON DELETE RESTRICT
);

INSERT INTO departments (id, name) VALUES 
(1, 'Engineering'),
(2, 'Design'),
(3, 'Marketing'),
(4, 'Human Resources');

INSERT INTO employees (name, salary, dept_id) VALUES 
('Ahmed',  1700.00, 1),   
('Sara',   3800.00, 1),    
('Khaled', 5900.00, 2),  
('Laila',  8300.00, 3),   
('Omar',  13000.00, NULL); 

-- == ======================================================
system clear;
SELECT 
    d.name      AS Department, 
    COUNT(e.id) AS Total_Employees
FROM departments d
LEFT JOIN employees e ON d.id = e.dept_id
GROUP BY d.id
HAVING Total_Employees < 2;
-- +-----------------+-----------------+
-- | Department      | Total_Employees |
-- +-----------------+-----------------+
-- | Design          |               1 |
-- | Marketing       |               1 |
-- | Human Resources |               0 |
-- +-----------------+-----------------+
