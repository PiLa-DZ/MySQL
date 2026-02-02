-- In SQL, we don't really have "Groups" like in Windows. Instead, 
-- we have ROLES. 
-- You create a Role (like a template), 
-- give it permissions, 
-- and then assign that Role to different programmers.

-- -- ------------------------------------------------------
-- 1. Create Roles for the Team
CREATE ROLE 'developer_role';
CREATE ROLE 'junior_role';

-- -- ------------------------------------------------------
-- 2. Give 'Developer' full access to the project database
GRANT ALL PRIVILEGES ON project_db.* TO 'developer_role';
-- 3. Give 'Junior' only Read/Write access (No DROP TABLE allowed!)
GRANT SELECT, INSERT, UPDATE ON project_db.* TO 'junior_role';

-- -- ------------------------------------------------------
-- 4. Create actual accounts for your teammates
CREATE USER 'ahmed_dev'@'%' IDENTIFIED BY 'password123';
CREATE USER 'sara_junior'@'%' IDENTIFIED BY 'secure_pass';

-- -- ------------------------------------------------------
-- 5. Assign the Roles to the Users
GRANT 'developer_role' TO 'ahmed_dev';
GRANT 'junior_role' TO 'sara_junior';

-- -- ------------------------------------------------------
-- 6. IMPORTANT: Activate the roles
SET DEFAULT ROLE 'developer_role' FOR 'ahmed_dev';
