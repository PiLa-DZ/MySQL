-- == Relational Databases =================================
-- == FOREIGN KEY ==========================================
-- NOTE: Most be 2 TABLES
--       1 - Parent TABLE
--       2 - Child  TABLE
-- NOTE: It Point to (PRIMARY KEY) to Parent Table
-- NOTE: You cat't edit it after create (FOREIGN KEY)
-- NOTE: If you want to edit it you have to recreate it

-- TODO: You have to create (Parent TABLE) First -----------
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- TODO: Now you can create (Child TABLE) ------------------
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    dept_id INT,
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) 
    REFERENCES departments(id) ON DELETE RESTRICT
);

-- TODO: After Create Table --------------------------------
-- NOTE: You cat't edit it after create (FOREIGN KEY)
ALTER TABLE employees
ADD CONSTRAINT fk_dept FOREIGN KEY (dept_id) 
REFERENCES departments(id) ON DELETE RESTRICT;

-- NOTE: So how you can edit (FOREIGN KEY) -----------------
-- 1 -> First you have to now whate is name of old (FOREIGN KEY)
SHOW CREATE TABLE employees
-- 2 -> Now you have to delete it
ALTER TABLE employees DROP FOREIGN KEY fk_dept;
-- 3 -> Create it again with now settings
ALTER TABLE employees
ADD CONSTRAINT fk_dept FOREIGN KEY (dept_id) 
REFERENCES departments(id) ON DELETE RESTRICT;

ALTER TABLE employees
ADD CONSTRAINT fk_dept FOREIGN KEY (dept_id) 
REFERENCES departments(id) ON DELETE SET NULL; 
-- == ON DELETE ============================================
-- NOTE: ON DELETE RESTRICT (DEFAULT) ----------------------
--       You can't delete department row if 
--       any employees following it
-- NOTE: ON DELETE CASCADE ---------------------------------
--       If you delete department row it will
--       delete all employees following it
-- NOTE: ON DELETE SET NULL --------------------------------
--       Just make employee NULL



-- == Example ==============================================
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

SELECT e.name, d.name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id;
