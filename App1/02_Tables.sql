-- == Table Scripts ========================================
SHOW TABLES; -- List All Tables ============================
SHOW CREATE TABLE users \G -- Show Table Source Code =======
DESC users; -- Show Table Schema ===========================
RENAME TABLE users TO workers; -- Rename Table =============
DROP TABLE users; -- Delete Table ==========================
DROP TABLE IF EXISTS users;
CREATE TABLE users (id INT); -- Create Table ===============
-- == Copy Table ===========================================
-- == Copy Table (Structure & Data) All --------------------
CREATE TABLE users_full_copy LIKE users;
INSERT INTO users_full_copy SELECT * FROM users;
-- == Copy Data Without (PRIMARY KEY & AUTO_INCREMENT & ...)
CREATE TABLE users_backup AS SELECT * FROM users;
-- == Copy Table Structure ---------------------------------
-- == Copy (PRIMARY KEY & AUTO_INCREMENT & ...) Without Data
CREATE TABLE users_structure LIKE users;
-- == ======================================================
