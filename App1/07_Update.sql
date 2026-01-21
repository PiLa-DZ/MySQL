-- Update One USER and One Column
UPDATE users SET last_name = "Rami" WHERE id = 3;
-- Update One USER and Multi Columns
UPDATE users SET last_name = "Mari", age = 23 WHERE id = 4;
-- Update One Multi USERS
UPDATE users SET email = "Don't Have Email" WHERE age < 18;
