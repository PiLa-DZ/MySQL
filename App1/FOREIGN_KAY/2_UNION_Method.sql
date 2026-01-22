-- == FULL OUTPUT JOIN (UNION) =============================
SELECT e.name, d.name FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id
UNION
SELECT e.name, d.name FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.id;

-- print just NULL values ----------------------------------
SELECT e.name, d.name FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id
WHERE d.id IS NULL
UNION
SELECT e.name, d.name FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.id
WHERE e.id IS NULL;

-- ERORR: It Don't work with deferant amount of Rows -------

-- == More about UNION =====================================
-- Join 2 Tables with (first_name, last_name) --------------
-- Include Doublacated -------------------------------------
SELECT first_name, last_name FROM users
UNION ALL
SELECT first_name, last_name FROM workers;
