-- == Example 2 ============================================
-- Show all Engineering ------------------------------------
SELECT name FROM employees 
WHERE dept_id IN (SELECT id FROM departments WHERE name = 'Engineering');

-- == Example 1 ============================================
-- The inner query finds the average (3000)
-- The outer query finds people who earn more than that
SELECT name, salary FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- == Example 3 ============================================
-- Show all phones sheap than (iPhone 15 Pro)
SELECT 
    p.name AS Cheap_Phone,
    p.price AS Cheap_Phone_Price,
    iPhone_15_Pro.price AS iPhone_15_Pro_Price,
    (iPhone_15_Pro.price - p.price) AS Price_Difference
FROM products p, 
     (SELECT price FROM products WHERE name = 'iPhone 15 Pro') AS iPhone_15_Pro
WHERE p.price < iPhone_15_Pro.price;

-- == Example 1 ============================================
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50),
    age INT,
    salary DECIMAL(8, 2)
);
INSERT INTO employees (name, email, age, salary) VALUES 
('Ahmed',  "ahmed@gmail.com",  22, 2200.00),
('Sara',   "sara@gmail.com",   28, 2800.00),
('Khaled', "khaled@gmail.com", 32, 3200.00),
('Laila',  "laila@gmail.com",  13, 1300.00),
('Omar',   "omar@gmail.com",   29, 2900.00);

system clear;
-- The inner query finds the average (3000)
-- The outer query finds people who earn more than that
SELECT name, salary FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- == Example 2 ============================================
DROP TABLE IF EXISTS employees, departments; system clear;
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) 
    REFERENCES departments(id) ON DELETE RESTRICT
);
INSERT INTO departments (id, name) VALUES 
(1, 'Engineering'),
(2, 'Design'),
(3, 'Marketing'),
(4, 'Human Resources'); -- I haven't created this section yet.
INSERT INTO employees (name, dept_id) VALUES 
('Ahmed', 1),   -- Engineering
('Sara', 1),    -- Engineering
('Khaled', 2),  -- Design
('Laila', 3),   -- Marketing
('Omar', NULL); -- This is a new employee who has not yet been assigned a department.

system clear;
-- Show all Engineering ------------------------------------
SELECT name FROM employees 
WHERE dept_id IN (SELECT id FROM departments WHERE name = 'Engineering');

-- == Example 3 ============================================
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    brand VARCHAR(30),
    price DECIMAL(10, 2),
    alternative_product_id INT,
    FOREIGN KEY (alternative_product_id) REFERENCES products(id)
);
INSERT INTO products (name, brand, price, alternative_product_id) VALUES 
('iPhone 15 Pro',    'Apple',   1200,  NULL),
('iPhone 14',        'Apple',   800,   1   ),
('Galaxy S23 Ultra', 'Samsung', 1100,  NULL),
('Galaxy A54',       'Samsung', 400,   3   ),
('Google Pixel 8',   'Google',  700,   NULL),
('Any Phone Else',   'Any',    2700,   NULL);
system clear;
-- Show all phones sheap than (iPhone 15 Pro)
SELECT 
    p.name AS Cheap_Phone,
    p.price AS Cheap_Phone_Price,
    iPhone_15_Pro.price AS iPhone_15_Pro_Price,
    (iPhone_15_Pro.price - p.price) AS Price_Difference
FROM products p, 
     (SELECT price FROM products WHERE name = 'iPhone 15 Pro') AS iPhone_15_Pro
WHERE p.price < iPhone_15_Pro.price;
-- == ======================================================
