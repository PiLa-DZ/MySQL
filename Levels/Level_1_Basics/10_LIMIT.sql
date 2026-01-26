-- == LIMIT ================================================
SELECT * FROM users LIMIT 1; -- Get first 1 user
SELECT * FROM users LIMIT 3; -- Get first 3 user
-- Sort and Get First Three users
SELECT * FROM users ORDER BY first_name LIMIT 3;
-- -- ------------------------------------------------------
-- First  Argoment (Start index)
-- Second Argoment (How Many)
SELECT * FROM users LIMIT 1, 4;
