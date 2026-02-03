-- 1 -> First you have to know whate is old (FOREIGN KEY) name
SHOW CREATE TABLE employees
-- 2 -> Now you have to delete it
ALTER TABLE employees DROP FOREIGN KEY fk_dept;

