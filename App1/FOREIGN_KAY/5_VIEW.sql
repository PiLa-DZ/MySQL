-- ======================================================
-- 1. Create Tables
-- ======================================================
-- Clean up environment
DROP VIEW IF EXISTS star_employees_report;
DROP TABLE IF EXISTS sales, employees;

-- Create Employees Table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50)
);

-- Create Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    amount DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(id)
);

-- Populate Data
INSERT INTO employees (name, department) VALUES 
('Ahmed', 'IT'), ('Sara', 'Sales'), ('Ali', 'Sales'), ('Mona', 'Marketing');

INSERT INTO sales (emp_id, amount, sale_date) VALUES 
(2, 500.00, '2024-01-10'),
(2, 1500.00, '2024-01-15'),
(3, 3000.00, '2024-01-20'),
(4, 200.00, '2024-01-22'),
(2, 500.00, '2024-02-01');

-- ======================================================
-- 2. CREATE THE VIEW
-- ======================================================
-- A View is like a saved "virtual table"
CREATE VIEW star_employees_report AS
SELECT 
    e.name AS employee_name, 
    SUM(s.amount) AS total_sales, 
    COUNT(s.sale_id) AS sales_count,
    AVG(s.amount) AS average_per_sale
FROM employees e
JOIN sales s ON e.id = s.emp_id
GROUP BY e.id, e.name
HAVING total_sales > 1000;

system clear;
-- == ======================================================
-- Simply query the view like a normal table
SELECT * FROM star_employees_report;
-- You can even filter the view!
SELECT employee_name FROM star_employees_report WHERE sales_count > 2;
-- You can also update users NOTE: (another table)
UPDATE users_greater_than_18 SET age = 20 WHERE name = 'h';

-- == Another Example ======================================
-- If you update (VIEW) it also will be update (original table)
DROP VIEW IF EXISTS users_greater_than_18;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT auto_increment primary key,
    name VARCHAR(50),
    age INT
);
INSERT INTO users (name, age) VALUES
("Sara", 9),
("Ali", 24),
("Mona", 33),
("Adem", 13),
("Amir", 18);
CREATE VIEW users_greater_than_18 AS
SELECT * FROM users WHERE age >= 18;

system clear;

system echo "-- == (Before Update =======================================";
SELECT * FROM users;
SELECT * FROM users_greater_than_18;

-- If you update (VIEW) it also will be update (original table)
UPDATE users_greater_than_18 SET age = 20 WHERE name = 'Amir';

system echo "-- == (After Update) =======================================";
SELECT * FROM users;
SELECT * FROM users_greater_than_18;
