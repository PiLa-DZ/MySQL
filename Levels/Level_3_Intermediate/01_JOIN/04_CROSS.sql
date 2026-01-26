-- == Cross JION ===========================================
SELECT * 
FROM employees
CROSS JOIN departments 
ON employees.dept_id = departments.id;
