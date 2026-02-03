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
