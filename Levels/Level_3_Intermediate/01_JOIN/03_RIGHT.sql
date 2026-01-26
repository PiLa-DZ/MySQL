-- == Right JION ===========================================
SELECT * 
FROM employees
RIGHT JOIN departments 
ON employees.dept_id = departments.id;

