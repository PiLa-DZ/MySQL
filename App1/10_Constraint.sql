-- == DEFAULT CONSTRAINT ===================================
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(25),
    created_at DATETIME DEFAULT NOW()
);
-- Add After Create Table
ALTER TABLE users ALTER create_at SET DEFAULT NOW();
-- == ======================================================

-- == CHECK CONSTRAINT =====================================
CREATE TABLE workers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    CONSTRAINT check_age CHECK (age >= 18)
);
-- Add After Create a Table
ALTER TABLE workers ADD CONSTRAINT check_age CHECK(age >= 18);
-- Delete (CHECK CONSTRAINT)
ALTER TABLE workers DROP CHECK check_age;
-- == ======================================================
