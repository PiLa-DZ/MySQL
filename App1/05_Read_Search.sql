SELECT * FROM users;
SELECT first_name, last_name FROM users;
SELECT first_name AS F_NAME, last_name AS L_NAME FROM users;

SELECT * FROM users WHERE id = 6;
SELECT * FROM users WHERE first_name = "Amin";
SELECT * FROM users WHERE age >= 18;
SELECT * FROM users WHERE age <= 59;
SELECT * FROM users WHERE age != 25;
SELECT * FROM users WHERE email IS NULL
SELECT * FROM users WHERE email IS NOT NULL


