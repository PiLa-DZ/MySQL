-- == NOT NULL =============================================
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(25),
    age INT NOT NULL
);
-- Add to the comumn
ALTER TABLE users MODIFY age INT NOT NULL;
-- == ======================================================
