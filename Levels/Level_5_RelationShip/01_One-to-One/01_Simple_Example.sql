-- == ======================================================
-- (Users and Profiles)
-- The Rule:
-- 1. One User Has One Profile
-- 2. One Profile belongs to Only One User
-- == ======================================================

-- -- Step 1 Create ----------------------------------------
DROP TABLE IF EXISTS profiles, users;
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

-- -- Step 1 Test ------------------------------------------
-- ERROR:
-- INSERT INTO profiles (bio, website_url, user_id) VALUES
-- ('Fron-End & Linux lover', 'https://min.dev', 1);

-- Read
SELECT u.username, p.bio FROM users u
JOIN profiles p ON u.id = p.user_id;
-- +---------------+--------------------------------------------+
-- | username      | bio                                        |
-- +---------------+--------------------------------------------+
-- | amine_dev     | Backend Developer & Linux lover            |
-- | yasmin_design | UI/UX Designer specializing in Mobile Apps |
-- +---------------+--------------------------------------------+
