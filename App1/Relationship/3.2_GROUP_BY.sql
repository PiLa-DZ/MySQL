-- Mission (sales_data)
DROP TABLE IF EXISTS sales, employees;
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    amount DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(id)
);

INSERT INTO employees (name, department) VALUES 
('Ahmed', 'IT'), 
('Sara', 'Sales'), 
('Ali', 'Sales'), 
('Mona', 'Marketing');

INSERT INTO sales (emp_id, amount, sale_date) VALUES 
(2, 500.00, '2024-01-10'),
(2, 1500.00, '2024-01-15'), -- Sara Sales 2 Times
(3, 3000.00, '2024-01-20'), -- Ali Sales 1 Time With Big Price
(4, 200.00, '2024-01-22'),  -- Mona Sales 1 Time With Small Price
(2, 500.00, '2024-02-01');  -- Sara Sales for 3de Times
system clear;
-- == ======================================================
SELECT 
    e.name AS Name, 
    SUM(s.amount) AS Total_Sales, 
    COUNT(e.id) AS Number_Of_Orders,
    AVG(s.amount) AS Average_Orders
FROM employees e
JOIN sales s
ON e.id = s.emp_id
GROUP BY e.id, e.name
HAVING Total_Sales > 1000
ORDER BY Total_Sales DESC; 
/* == Your task ============================================
We want to generate a "Star Employees" report. Write a query that displays the following:
1 - Employee name.
2 - Total sales amount generated (use SUM).
3 - Number of sales made (use COUNT).
4 - Average sales per transaction (use AVG).

Challenge requirements:
- Only display employees whose total sales exceed 1000.
- The results must be sorted from highest to lowest sales.
- Use professional aliases for each resulting column 
     (Total_Sales, Number_of_Orders, Average_Order).
*/
