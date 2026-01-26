-- == LEFT JOIN ============================================
SELECT * 
FROM employees
LEFT JOIN departments 
ON employees.dept_id = departments.id;

