-- == GROUP_CONCAT =========================================
-- == Step 1: Create Tables ================================
DROP TABLE IF EXISTS user_groups, users, groups;
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL
);
INSERT INTO users (username) VALUES ('Ahmed'), ('Sara'), ('Laila');
CREATE TABLE groups (
    id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(50) NOT NULL
);
INSERT INTO groups (group_name) VALUES ('Admins'), ('Developers'), ('Designers');

-- == Step 2: Create (The Junction Table) ==================
CREATE TABLE user_groups (
    user_id INT,
    group_id INT,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, group_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE
);
-- Link them in the Junction Table (Many-to-Many)
INSERT INTO user_groups (user_id, group_id) VALUES 
(1, 1), (1, 2), -- Ahmed is Admin and Developer
(2, 2), (2, 3), -- Sara is Developer and Designer
(3, 3);         -- Laila is Designer only

-- == Step 3: Show Tables using (GROUP_CONCAT) =============
system clear;

-- -- GROUP_CONCAT(name SEPARATOR '') ----------------------
SELECT 
    u.username,
    GROUP_CONCAT(g.group_name SEPARATOR ', ') AS joined_groups
FROM users u
JOIN user_groups ug ON u.id = ug.user_id
JOIN groups g ON ug.group_id = g.id
GROUP BY u.username;
-- +----------+-----------------------+
-- | username | joined_groups         |
-- +----------+-----------------------+
-- | Ahmed    | Admins, Developers    |
-- | Laila    | Designers             |
-- | Sara     | Developers, Designers |
-- +----------+-----------------------+

-- -- GROUP_CONCAT(name ORDER BY SEPARATOR '') -------------
SELECT 
    u.username,
    GROUP_CONCAT(
        g.group_name 
        ORDER BY g.group_name ASC
        SEPARATOR ' | '
    ) AS formatted_groups
FROM users u
JOIN user_groups ug ON u.id = ug.user_id
JOIN groups g ON ug.group_id = g.id
GROUP BY u.username;
-- +----------+------------------------+
-- | username | formatted_groups       |
-- +----------+------------------------+
-- | Ahmed    | Admins | Developers    |
-- | Laila    | Designers              |
-- | Sara     | Designers | Developers |
-- +----------+------------------------+
