-- == ORDER BY =============================================
-- Sort all users by last_name
SELECT * FROM users ORDER BY last_name;

-- Reverse Sort
SELECT * FROM users ORDER BY last_name DESC;

-- Sort all users by (first_name, last_name) column
-- If 2 column is the same first_name sort by last_name column
SELECT * FROM users ORDER BY first_name, last_name;
