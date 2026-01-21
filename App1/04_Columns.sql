-- Add Column
ALTER TABLE users ADD email VARCHAR(50);
-- Rename Column
ALTER TABLE users RENAME COLUMN email TO name;
-- Edit column size
ALTER TABLE users MODIFY COLUMN email VARCHAR(100);
-- Delete column
ALTER TABLE employees DROP COLUMN email;

-- Move column index
ALTER TABLE users MODIFY email VARCHAR(100) AFTER last_name;
-- Move column to the firs index
ALTER TABLE employees MODIFY email VARCHAR(100) FIRST;
