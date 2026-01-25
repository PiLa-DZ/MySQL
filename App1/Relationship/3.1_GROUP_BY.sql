-- == ======================================================
SELECT 
    d.name      AS Department, 
    COUNT(e.id) AS Total_Emplyees
FROM departments d
LEFT JOIN employees e 
ON d.id = e.dept_id
GROUP BY d.id;

-- == ======================================================
SELECT 
    d.name      AS Department, 
    COUNT(e.id) AS Total_Employees
FROM departments d
LEFT JOIN employees e ON d.id = e.dept_id
GROUP BY d.id
HAVING Total_Employees < 2;
