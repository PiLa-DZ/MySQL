-- == ======================================================
SELECT 
    d.name      AS Department, 
    COUNT(e.id) AS Total_Emplyees
FROM departments d
LEFT JOIN employees e 
ON d.id = e.dept_id
GROUP BY d.id;
