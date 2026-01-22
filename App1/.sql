system clear;
drop table employees, departments;

CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) 
    REFERENCES departments(id) ON DELETE RESTRICT
);

INSERT INTO departments (id, name) VALUES 
(1, 'Engineering'),
(2, 'Design'),
(3, 'Marketing'),
(4, 'Human Resources'); -- I haven't created this section yet.

INSERT INTO employees (name, dept_id) VALUES 
('Ahmed', 1),   -- Engineering
('Sara', 1),    -- Engineering
('Khaled', 2),  -- Design
('Laila', 3),   -- Marketing
('Omar', NULL); -- This is a new employee who has not yet been assigned a department.

system clear;

SELECT departments.name, COUNT(employees.id)
FROM departments
LEFT JOIN employees ON departments.id = employees.dept_id
GROUP BY departments.id;
