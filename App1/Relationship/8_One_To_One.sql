-- 1. Create Users Table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Create Profiles Table (The One-to-One partner)
CREATE TABLE profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    bio TEXT,
    website_url VARCHAR(255),
    user_id INT UNIQUE, -- UNIQUE constraint makes it One-to-One
    CONSTRAINT fk_user_profile FOREIGN KEY (user_id) 
    REFERENCES users(id) ON DELETE CASCADE
);

-- 3. Insert Data
INSERT INTO users (username, email) VALUES 
('amine_dev', 'amine@example.com'),
('yasmin_design', 'yasmin@example.com');

INSERT INTO profiles (bio, website_url, user_id) VALUES 
('Backend Developer & Linux lover', 'https://amine.dev', 1),
('UI/UX Designer specializing in Mobile Apps', 'https://yasmin.art', 2);

-- ERROR:
INSERT INTO profiles (bio, user_id) VALUES ('Hacker Bio', 1);

-- Read
SELECT u.username, u.email, p.bio
FROM users u
JOIN profiles p ON u.id = p.user_id;
