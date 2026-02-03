-- == Advanced Example 4 ===================================
-- -- The Scenario: Automatic Post Counting
-- -- We want to keep track of how many posts each user 
--    has without running a slow COUNT(*) query
--    every time we load their profile.
-- == ======================================================
DROP TABLE IF EXISTS posts, users;
DROP TRIGGER IF EXISTS after_post_insert;
-- 1. Create the tables
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    total_posts INT DEFAULT 0
);
INSERT INTO users (name) VALUES ("Amin");
CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    content TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- -- ------------------------------------------------------
-- 2. Create the AFTER TRIGGER
DELIMITER $$
CREATE TRIGGER after_post_insert
AFTER INSERT ON posts
FOR EACH ROW
BEGIN
    -- This only runs IF the insert into 'posts' was successful
    UPDATE users 
    SET total_posts = total_posts + 1 
    WHERE id = NEW.user_id;
END $$
DELIMITER ;

-- -- ------------------------------------------------------
-- 3. Test
-- Check stats before
SELECT * FROM users; 
-- +----+------+-------------+
-- | id | name | total_posts |
-- +----+------+-------------+
-- |  1 | Amin |           0 |
-- +----+------+-------------+

-- Insert a posts
INSERT INTO posts (user_id, content) VALUES (1, 'Hello World! My first post.');
INSERT INTO posts (user_id, content) VALUES (1, 'Hello World! My second post.');

-- Check stats after
SELECT * FROM users;
-- +----+------+-------------+
-- | id | name | total_posts |
-- +----+------+-------------+
-- |  1 | Amin |           2 |
-- +----+------+-------------+
