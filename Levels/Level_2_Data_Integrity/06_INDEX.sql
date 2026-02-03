-- == INDEXES Type =========================================
-- 1. PRIMARY KEY
-- 2. UNIQUE INDEX
-- 3. INDEX (or KEY)
-- 4. FULLTEXT

-- == ======================================================
DROP TABLE IF EXISTS members;
-- 1. Create table with an index on 'email'
CREATE TABLE members (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100),
    age INT,
    INDEX (name),          -- Normal index for fast searching by name
    UNIQUE INDEX (email)   -- Unique index to prevent duplicate emails
);

-- == ======================================================
-- 2. Adding an index to an EXISTING table
-- Let's say we decided later to index 'age'
CREATE INDEX idx_age ON members(age);
-- Create Multi INDEX (Composite Index)
CREATE INDEX idx_name_email ON members(name, email);

-- == ======================================================
INSERT INTO members (name, email, age) VALUES 
('Ahmed',  "ahmed@gmail.com",  22),
('Sara',   "sara@gmail.com",   28),
('Khaled', "khaled@gmail.com", 32),
('Laila',  "laila@gmail.com",  13),
('Omar',   "omar@gmail.com",   29);

system clear;
-- == ======================================================
-- 3. Now try this
--    you have to see ((ref) or (index)) rew on (type) column
--    you have to see ("Your search column name") on (possible_key) column
--    you are in the right way
EXPLAIN SELECT * FROM members WHERE name = 'Ahmed';

-- Show all indexes of table
SHOW INDEXES FROM members;
-- Delete index
ALTER TABLE members DROP INDEX idx_age;
-- or
DROP INDEX idx_age ON members;

