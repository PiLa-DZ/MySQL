-- == Advanced Example 1 ================================
DROP VIEW IF EXISTS star_employees_report;
DROP TABLE IF EXISTS sales, employees;
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50)
);
INSERT INTO employees (name, department) VALUES 
('Ahmed', 'IT'), ('Sara', 'Sales'), ('Ali', 'Sales'), ('Mona', 'Marketing');
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    amount DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(id)
);
INSERT INTO sales (emp_id, amount, sale_date) VALUES 
(2, 500.00, '2024-01-10'),
(2, 1500.00, '2024-01-15'),
(3, 3000.00, '2024-01-20'),
(4, 200.00, '2024-01-22'),
(2, 500.00, '2024-02-01');

-- -- Create VIEW ------------------------------------------
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

-- -- ------------------------------------------------------
-- Simply query the view like a normal table
SELECT * FROM star_employees_report;
-- +---------------+-------------+-------------+------------------+
-- | employee_name | total_sales | sales_count | average_per_sale |
-- +---------------+-------------+-------------+------------------+
-- | Sara          |     2500.00 |           3 |       833.333333 |
-- | Ali           |     3000.00 |           1 |      3000.000000 |
-- +---------------+-------------+-------------+------------------+

-- -- ------------------------------------------------------
-- You can even filter the view!
SELECT employee_name FROM star_employees_report WHERE sales_count > 2;
-- +---------------+
-- | employee_name |
-- +---------------+
-- | Sara          |
-- +---------------+
