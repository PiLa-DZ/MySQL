-- == Advanced Example 3 ===================================
-- == Create log if employee deleted =======================
-- == ======================================================
-- 1. Create Tables
DROP TABLE IF EXISTS employees, departments, deleted_employees_log;
DROP TRIGGER IF EXISTS after_employee_delete;
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

-- -- ------------------------------------------------------
-- 2. Create Deleted log
CREATE TABLE deleted_employees_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- -- ------------------------------------------------------
-- 3. Create Trigger
DELIMITER $$
CREATE TRIGGER after_employee_delete
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    -- We use OLD because the data is being removed
    INSERT INTO deleted_employees_log (emp_name) VALUES (OLD.name);
END $$
DELIMITER ;

-- -- ------------------------------------------------------
-- 4. Test
DELETE FROM employees WHERE name = "Sara";
SELECT * FROM deleted_employees_log; 
-- +--------+----------+---------------------+
-- | log_id | emp_name | deleted_at          |
-- +--------+----------+---------------------+
-- |      1 | Sara     | 2026-01-30 10:41:04 |
-- +--------+----------+---------------------+
