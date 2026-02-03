-- == CREATE ===============================================
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
CREATE TABLE users (id INT); -- Create Table (Minimum) =====

-- == ALTER ================================================
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

-- == SHOW =================================================
SHOW TABLES; -- List All Tables ============================
SHOW CREATE TABLE users \G -- Show Table Source Code =======

-- == SCHEMA ===============================================
DESCRIBE users; -- Show Table Schema =======================
DESC     users; -- Show Table Schema =======================
EXPLAIN  users; -- Show Table Schema =======================

-- == RENAME ===============================================
RENAME TABLE users TO workers; -- Rename Table =============

-- == DELETE ===============================================
DROP TABLE users; -- Delete Table ==========================
DROP TABLE IF EXISTS users; -- Delete Table if exists ======

-- == Copy Table (Structure & Data) All ====================
CREATE TABLE users_full_copy LIKE users;
INSERT INTO users_full_copy SELECT * FROM users;

-- == Copy Data Without (PRIMARY KEY & AUTO_INCREMENT & ...)
CREATE TABLE users_backup AS SELECT * FROM users;

-- == Copy (PRIMARY KEY & AUTO_INCREMENT & ...) Without Data
CREATE TABLE users_structure LIKE users;
