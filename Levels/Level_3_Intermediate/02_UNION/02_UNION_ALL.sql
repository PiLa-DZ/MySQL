-- == More about UNION =====================================
-- Join 2 Tables with (first_name, last_name) --------------
-- Include Doublacated -------------------------------------
SELECT first_name, last_name FROM users
UNION ALL
SELECT first_name, last_name FROM workers;

-- ERORR: It Don't work with deferant amount of Rows -------
