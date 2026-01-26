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
