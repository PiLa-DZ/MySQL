-- == (One-To-One RelationShip) ============================
-- == ( Users & Profiles ) =================================
-- NOTE: You have to lear (One-to-One relationships)
-- (One User) Have --> (One Profiles)
-- This procedure creates a user and their profile at the same time.
-- == ======================================================

-- -- Step 1 : Create Tables and Data ----------------------
DROP TABLE IF EXISTS profiles, users; 
DROP PROCEDURE IF EXISTS RegisterUser; 

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    bio TEXT,
    website_url VARCHAR(255),
    user_id INT UNIQUE, -- UNIQUE constraint makes it One-to-One
    CONSTRAINT fk_user_profile FOREIGN KEY (user_id) 
    REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO users (username, email) VALUES 
('amine_dev', 'amine@example.com'),
('yasmin_design', 'yasmin@example.com');
INSERT INTO profiles (bio, website_url, user_id) VALUES 
('Backend Developer & Linux lover', 'https://amine.dev', 1),
('UI/UX Designer specializing in Mobile Apps', 'https://yasmin.art', 2);

-- -- Step 2 : Create PROCEDURE ----------------------------
DELIMITER //
CREATE PROCEDURE RegisterUser(
    IN p_username VARCHAR(50), 
    IN p_email VARCHAR(100)
)
BEGIN
    -- 1. Insert the new user
    INSERT INTO users (username, email) VALUES (p_username, p_email);
    -- 2. Get the ID of the user we just created
    SET @new_user_id = LAST_INSERT_ID();
    -- 3. Automatically create an empty profile for them
    INSERT INTO profiles (bio, user_id) VALUES ('Welcome to my profile!', @new_user_id);
    -- 4. Return a confirmation message
    SELECT 'User and Profile created successfully' AS message;
END //
DELIMITER ;

-- -- Step 3 : Call the PROCEDURE --------------------------
-- 1. Before Call PROCEDURE
SELECT username, email, bio FROM users
JOIN profiles ON users.id = profiles.user_id;
-- +---------------+--------------------+--------------------------------------------+
-- | username      | email              | bio                                        |
-- +---------------+--------------------+--------------------------------------------+
-- | amine_dev     | amine@example.com  | Backend Developer & Linux lover            |
-- | yasmin_design | yasmin@example.com | UI/UX Designer specializing in Mobile Apps |
-- +---------------+--------------------+--------------------------------------------+

-- 2. Call PROCEDURE
CALL RegisterUser('JohnDoe', 'john@example.com');
-- +---------------------------------------+
-- | message                               |
-- +---------------------------------------+
-- | User and Profile created successfully |
-- +---------------------------------------+

-- 3. After Call PROCEDURE
SELECT username, email, bio FROM users
JOIN profiles ON users.id = profiles.user_id;
-- +---------------+--------------------+--------------------------------------------+
-- | username      | email              | bio                                        |
-- +---------------+--------------------+--------------------------------------------+
-- | amine_dev     | amine@example.com  | Backend Developer & Linux lover            |
-- | yasmin_design | yasmin@example.com | UI/UX Designer specializing in Mobile Apps |
-- | JohnDoe       | john@example.com   | Welcome to my profile!                     |
-- +---------------+--------------------+--------------------------------------------+
