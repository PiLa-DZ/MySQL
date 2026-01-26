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
