-- == Create COLUMNU when create TABLE =====================
create table users (
    id INT,
    name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    salary DECIMAL(10, 2)
)

-- == After Create TABLE ===================================
-- Add Column
ALTER TABLE users ADD    email VARCHAR(50);
-- Rename Column
ALTER TABLE users RENAME COLUMN email TO name;
-- Delete column
ALTER TABLE users DROP   COLUMN email;

-- Show One Column
SELECT name FROM users;
-- Show Many Column
SELECT name, age, email FROM users;
-- Show All Column
SELECT * FROM users;
