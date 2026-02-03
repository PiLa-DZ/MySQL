# Introduction
# User Management
# Revoking Access
# Common Permission Levels
# Deleting User
# Team Management

# Introduction
- DCL (Data Control Language).
    - This is how you manage who can actually run those queries in a real-world production environment.

- Summary for your Security/DCL Folder
    1. User ID   : Always consist of 'user'@'host'.
    2. Privileges: SELECT, INSERT, UPDATE, DELETE, CREATE, DROP.
    3. Apply     : GRANT  ... TO   ...
    4. Remove    : REVOKE ... FROM ...
    5. Refresh   : FLUSH PRIVILEGES;

- ⚠️ Security Pro-Tip
    - As a backend developer, 
    - when you connect your Node.js, Python, or PHP app to the database, 
    - your .env file should use a user created with the "Principle of Least Privilege." 
    - If your app doesn't need to DROP tables, 
    - don't give that user the permission to do so. 
    - This way, if your app is hacked, 
    - the hacker can't delete your entire database.

# User Management
```SQL
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
```

# Revoking Access
```SQL
/* You want to restrict them to "Read Only" access */
-- Take away the ability to insert and update
REVOKE INSERT, UPDATE ON facebook.* FROM 'dev_user'@'localhost';
-- Now they can only SELECT.
FLUSH PRIVILEGES;
```

# Common Permission Levels
```SQL
/*
+---------------------------------------------------------------------+
| When you use GRANT, you can be as broad or as specific as you want: |
+----------------+----------------------------------------------------+
| ALL PRIVILEGES | *.*           | Superuser / Admin (Dangerous!).    |
+----------------+----------------------------------------------------+
| SELECT         | db_name.*     | Reporting tools / Analysts (Safe). |
+----------------+----------------------------------------------------+
| INSERT, UPDATE | db_name.table | Backend APIs / App Users.          |
+----------------+----------------------------------------------------+
| CREATE, DROP   | db_name.*     | Migration scripts / Senior Devs.   |
+----------------+----------------------------------------------------+
*/
```

# Deleting User
```SQL
DROP USER 'dev_user'@'localhost';
```

# Team Management
```SQL
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
```
