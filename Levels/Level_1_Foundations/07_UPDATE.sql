-- Update One User and One Column
UPDATE users SET last_name = "Rami" WHERE id = 3;

-- Update One User and Multi Columns
UPDATE users SET last_name = "Mari", age = 23 WHERE id = 4;

-- Update Multi Users and One Column
UPDATE users SET email = "Don't Have Email" WHERE age < 18;
