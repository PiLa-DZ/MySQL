-- == Simple Example =======================================
-- Save User when Delete
-- == ======================================================
DROP TABLE IF EXISTS users, deleted_users;
DROP TRIGGER IF EXISTS on_delete_user;
CREATE TABLE users ( id INT, name VARCHAR(100));
INSERT INTO  users (id, name) VALUES (1, 'e'), (2, 'a'), (3, 'c');
CREATE TABLE deleted_users ( id INT, name VARCHAR(100));
-- -- ------------------------------------------------------
-- Create TRIGGER
DELIMITER $$
CREATE TRIGGER on_delete_user
BEFORE DELETE on users
FOR EACH ROW
BEGIN
    INSERT INTO deleted_users (id, name) VALUES (OLD.id, OLD.name);
END $$
DELIMITER ;

-- -- Before Delete user -----------------------------------
SELECT * FROM users; 
-- +------+------+
-- | id   | name |
-- +------+------+
-- |    1 | e    |
-- |    2 | a    |
-- |    3 | c    |
-- +------+------+
SELECT * FROM deleted_users; 
-- Empty set (0.000 sec)

-- -- After Delete user ------------------------------------
DELETE FROM users where id = 1; 

SELECT * FROM users; 
-- +------+------+
-- | id   | name |
-- +------+------+
-- |    2 | a    |
-- |    3 | c    |
-- +------+------+
SELECT * FROM deleted_users; 
-- +------+------+
-- | id   | name |
-- +------+------+
-- |    1 | e    |
-- +------+------+
