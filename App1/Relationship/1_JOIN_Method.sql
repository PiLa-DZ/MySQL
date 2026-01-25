-- == INNER JOIN (Default) =================================
-- Example 1 == Select All Columns -------------------------
SELECT * 
FROM employees
JOIN departments 
ON employees.dept_id = departments.id;
-- Or this -------------------------------------------------
SELECT * 
FROM employees
INNER JOIN departments 
ON employees.dept_id = departments.id;

-- Example 2 == Select 2 columns ---------------------------
SELECT employees.name, departments.name 
FROM employees
JOIN departments 
ON employees.dept_id = departments.id;

-- Example 3 == Table Alias --------------------------------
SELECT e.name, d.name 
FROM employees e
JOIN departments d 
ON e.dept_id = d.id;

-- Example 3 == Table Aliase And Column Aliases ------------
SELECT e.name AS E_Name, d.name AS D_Name
FROM employees e
JOIN departments d 
ON e.dept_id = d.id;

-- == LEFT JOIN ============================================
SELECT * 
FROM employees
LEFT JOIN departments 
ON employees.dept_id = departments.id;

-- == Right JION ===========================================
SELECT * 
FROM employees
RIGHT JOIN departments 
ON employees.dept_id = departments.id;
