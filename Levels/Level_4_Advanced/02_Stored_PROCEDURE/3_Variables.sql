-- == ======================================================
-- Comparison Summary
-- Variable Type,  Syntax,Scope,               JS Analogy
-- Local,          DECLARE x,                  Inside a BEGIN/END block,let x inside a function
-- User/Session,   @x,Current Connection only, sessionStorage or a global object
-- Global System,  @@x,The entire Server,      process.env or OS settings
-- Config Table (It's not a variable)

-- == ======================================================
-- Local Variables
DELIMITER //
CREATE PROCEDURE fun()
BEGIN
    DECLARE my_local_var INT DEFAULT 10; -- Like 'let x = 10' inside a function
    SELECT my_local_var;
END //
DELIMITER ;
CALL fun();
-- +--------------+
-- | my_local_var |
-- +--------------+
-- |           10 |
-- +--------------+

-- == ======================================================
-- Session Variables
SET @my_session_var = 100; -- Like 'window.x = 100'
SELECT @my_session_var; -- You can access this anywhere in your current session.
-- +-----------------+
-- | @my_session_var |
-- +-----------------+
-- |             100 |
-- +-----------------+

-- == ======================================================
-- Global System Variables
-- you cannot create new Global System Variables,
-- There is also a third type called Global System Variables (@@max_connections). 
-- These start with two @ signs and affect the entire MySQL server, 
-- not just your session. You usually need "Admin" privileges to change these!

-- -- ------------------------------------------------------
-- To View them:
-- You can check a specific setting or see the whole list:

-- See ALL system variables (there are hundreds!)
SHOW GLOBAL VARIABLES;

-- Check the maximum allowed connections to the server
SELECT @@max_connections;
-- +-------------------+
-- | @@max_connections |
-- +-------------------+
-- |               151 |
-- +-------------------+

-- -- ------------------------------------------------------
-- To Modify them:
-- If you have admin privileges (like the root user), you can change them. There are two ways to do this:
-- Global Change: Affects the whole server and all users.
SET GLOBAL max_connections = 200;
-- +-------------------+
-- | @@max_connections |
-- +-------------------+
-- |               200 |
-- +-------------------+

-- == ======================================================
-- 
-- What if I need a truly "Global" value for everyone?
-- If you want a piece of data that every user on the server can see 
-- (like a site-wide "Maintenance Mode" flag or a "Global Discount Rate"), 
-- the professional way to do it is to create a Configuration Table.

-- This is a common "Best Practice" in Backend Development:
CREATE TABLE site_settings (
    setting_key VARCHAR(50) PRIMARY KEY,
    setting_value VARCHAR(255)
);

INSERT INTO site_settings (setting_key, setting_value) 
VALUES ('maintenance_mode', 'false'), ('discount_rate', '0.10');
