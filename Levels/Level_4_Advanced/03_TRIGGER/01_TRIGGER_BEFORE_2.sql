-- == Example 2 ============================================
-- == "You can't make salary less than old salary" =========
-- 1. Create Tables
DROP TABLE IF EXISTS employees, departments, deleted_employees_log;
DROP TRIGGER IF EXISTS prevent_salary_drop;
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
-- 2. Create Trigger
DELIMITER //
CREATE TRIGGER prevent_salary_drop
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        set NEW.salary = OLD.salary;
    END IF;
END //
DELIMITER ;
-- 4. Test
system clear;
update employees set salary = 1000 where name = "Laila";
-- Employee salary doesn't update because (1000 < 3800)
select * from employees; 
