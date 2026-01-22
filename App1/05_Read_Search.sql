SELECT * FROM users;
SELECT first_name, last_name FROM users;
SELECT first_name AS F_NAME, last_name AS L_NAME FROM users;

-- -- ( = ) ( < ) ( > ) ( ! ) ------------------------------
SELECT * FROM users WHERE id = 6;
SELECT * FROM users WHERE first_name = "Amin";
SELECT * FROM users WHERE age >= 18;
SELECT * FROM users WHERE age <= 59;
SELECT * FROM users WHERE age != 25;
-- -- ( IS NULL ) ( IS NUT NULL ) --------------------------
SELECT * FROM users WHERE email IS NULL
SELECT * FROM users WHERE email IS NOT NULL

-- == Logical operators ====================================
-- -- ( AND ) ( OR ) ---------------------------------------
SELECT * FROM users WHERE age >= 18 AND age <= 59;
SELECT * FROM users WHERE age >= 18 OR hire_date <= "2023-01-5";
-- -- ( BETWEEN ) ( NOT ) ( IN ) ---------------------------
SELECT * FROM users WHERE age BETWEEN 18 AND 59;
SELECT * FROM users WHERE NOT job = "manager" AND NOT job = "asst. manager";
SELECT * FROM users WHERE job IN ("cook", "cashier", "janitor");

-- == Wild card characters =================================
-- -- ( LIKE ) ( % ) ( _ ) ---------------------------------
-- Any string start with "s"
SELECT * FROM users WHERE name LIKE "s%";
-- Any string end with "s"
SELECT * FROM users WHERE name LIKE "%s";
-- Any string have "s"
SELECT * FROM users WHERE name LIKE "%s%";
-- Find one random character folow by "ook"
SELECT * FROM users WHERE job LIKE "_ook";
-- Find two random character arownd "ook"
SELECT * FROM users WHERE job LIKE "_ook_";
-- Find all month match
SELECT * FROM users WHERE hire_date LIKE "____-01-__";
-- Find any name with secend character is "a"
SELECT * FROM usres WHERE job LIKE "_a%";

-- == ORDER BY =============================================
-- Sort all users by last_name
SELECT * FROM users ORDER BY last_name;
-- Reverse Sort
SELECT * FROM users ORDER BY last_name DESC;
-- Sort all users by (first_name, last_name) column
-- If 2 column is the same first_name sort by last_name column
SELECT * FROM users ORDER BY first_name, last_name;

-- == LIMIT ================================================
SELECT * FROM users LIMIT 1; -- Get first 1 user
SELECT * FROM users LIMIT 3; -- Get first 3 user
-- Sort and Get First Three users
SELECT * FROM users ORDER BY first_name LIMIT 3;
-- -- ------------------------------------------------------
-- First  Argoment (Start index)
-- Second Argoment (How Many)
SELECT * FROM users LIMIT 1, 4;

