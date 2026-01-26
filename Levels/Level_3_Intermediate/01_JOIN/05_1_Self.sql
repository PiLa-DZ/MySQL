DROP TABLE IF EXISTS employees, departments; system clear;
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    job VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(id)
);

INSERT INTO employees (name, job, manager_id) VALUES 
('Zaid',  'CEO',        NULL),
('Ahmed', 'IT Manager', 1),
('Sara',  'HR Manager', 1),
('Ali',   'Developer',  2),
('Laila', 'Designer',   2),
('Mona',  'Recruiter',  3);

SELECT 
    e.name AS Employee,
    e.job  AS Position,
    m.name AS Reports_To
FROM employees e
LEFT JOIN employees m 
ON e.manager_id = m.id
ORDER BY m.name DESC;

