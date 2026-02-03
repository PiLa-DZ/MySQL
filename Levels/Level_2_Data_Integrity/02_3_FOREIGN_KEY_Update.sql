-- NOTE: If you want to edit it you have to recreate it
-- NOTE: So how you can edit (FOREIGN KEY) -----------------
-- 1 -> First you have to know whate is old (FOREIGN KEY) name
SHOW CREATE TABLE employees
-- 2 -> Now you have to delete it
ALTER TABLE employees DROP FOREIGN KEY fk_dept;
-- 3 -> Create it again with now settings
ALTER TABLE employees
ADD CONSTRAINT fk_dept FOREIGN KEY (dept_id) 
REFERENCES departments(id) ON DELETE RESTRICT;

