system clear;
DROP TABLE IF EXISTS employees, departments;

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

SELECT *, count(m.id)
-- SELECT *
FROM employees e
LEFT JOIN employees m 
ON e.id = m.manager_id
group by e.id
