SELECT departments.name, COUNT(employees.id)
FROM departments
LEFT JOIN employees ON departments.id = employees.dept_id
GROUP BY departments.id;
