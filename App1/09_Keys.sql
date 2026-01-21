-- == PRIMARY KEY ==========================================
-- NOTE: It must be one PRIMARY KEY in a TABLE
-- NOTE: You can't repeat it
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(25),
);
-- Add After Create Table
ALTER TABLE users ADD CONSTRAINT PRIMARY KEY(id);
-- == ======================================================

-- == UNIQUE Key ===========================================
-- You can add "UNIQUE" whene you create a table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(25),
    email VARCHAR(25) UNIQUE
);
-- Add After Create Table
ALTER TABLE users ADD CONSTRAINT UNIQUE(email);
-- == ======================================================

-- == AUTO_INCREMENT =======================================
-- NOTE: It must be one AUTO_INCREMENT in a TABLE
-- NOTE: The column have to be KEY  like (PRIMARY | UNIQUE)
-- TODO: But you have to add AUTO_INCREMENT with PRIMARY KEY
-- NOTE: The Type Have to be Numger Like (INT | BIGINT)
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

-- After Create Column (if column have any KEY)
ALTER TABLE users MODIFY id INT AUTO_INCREMENT;
-- After Create Column (if column don't have any KEY)
ALTER TABLE users MODIFY id INT AUTO_INCREMENT PRIMARY KEY;
-- Change the default of AUTO_INCREMENT
ALTER TABLE users AUTO_INCREMENT = 1000;
-- == ======================================================
