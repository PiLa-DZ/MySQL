-- 1. Create a new user
-- Syntax: 'username'@'host' IDENTIFIED BY 'password'
-- 'localhost' means they can only connect from the same server.
CREATE USER 'dev_user'@'localhost' IDENTIFIED BY 'your_password';

-- 2. Give them specific permissions
-- We allow them to SELECT, INSERT, and UPDATE on all tables in 'facebook'
GRANT SELECT, INSERT, UPDATE ON facebook.* TO 'dev_user'@'localhost';

-- 3. The "Safety" Command
-- This tells MariaDB to reload the permissions table immediately
FLUSH PRIVILEGES;

-- 4. Check what permissions they have
SHOW GRANTS FOR 'dev_user'@'localhost';
