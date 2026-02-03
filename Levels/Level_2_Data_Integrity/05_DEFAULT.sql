-- == DEFAULT CONSTRAINT ===================================
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(25),
    created_at DATETIME DEFAULT NOW()
);
-- Add After Create Table
ALTER TABLE users ALTER create_at SET DEFAULT NOW();
-- == ======================================================

