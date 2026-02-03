-- == FOREIGN KEY ==========================================
-- NOTE: Most be 2 TABLES (Parent TABLE & Child TABLE)
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
