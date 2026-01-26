-- == Example 1 ============================================
-- == "Employees salary must be greater than 1500" =========
-- 1. Create Tables
SHOW TRIGGERS;
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
('Khaled', 5900.00, 2),  
('Laila',  8300.00, 3),   
('Omar',  13000.00, NULL); 
-- 2. Create the Trigger
DELIMITER //
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    -- Logic: If the incoming salary is less than 1500, fix it!
    IF NEW.salary < 1500 THEN
        SET NEW.salary = 1500;
    END IF;
END //
DELIMITER ;
-- 3. Test the Trigger
-- Let's try to insert a worker with a very low salary
INSERT INTO employees (name, salary, dept_id) 
VALUES ('Zaid', 900.00, 1);
-- 4. Check the result
SELECT * FROM employees WHERE name = 'Zaid';
