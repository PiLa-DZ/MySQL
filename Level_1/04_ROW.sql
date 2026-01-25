-- == Create ===============================================
-- Create One Row
INSERT INTO users (name, age) VALUES ("Amin", 22);

-- Create Many Rows
INSERT INTO users (name, age) VALUES 
("Amir", 22), 
("Sara", 25), 
("Jol", 34);

-- == Read =================================================
-- Show All Rows
SELECT * FROM users;
-- Show All Rows
SELECT * FROM users WHERE id = 1;

-- == Update ===============================================
-- Update One Row and one column
UPDATE TABLE users SET name = "Amir" WHERE id = 1;
