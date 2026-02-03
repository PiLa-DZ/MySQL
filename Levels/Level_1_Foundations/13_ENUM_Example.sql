-- == Level_01_Basics/ENUM_Example.sql =====================
DROP TABLE IF EXISTS support_tickets;

CREATE TABLE support_tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subject VARCHAR(100),
    -- Define the allowed values for Priority
    priority ENUM('Low', 'Medium', 'High', 'Urgent') DEFAULT 'Medium',
    -- Define the allowed values for Status
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed') DEFAULT 'Open'
);

-- 1. Correct Usage
INSERT INTO support_tickets (subject, priority, status) 
VALUES ('Login Error', 'Urgent', 'Open');

-- 2. Using the Default Value
INSERT INTO support_tickets (subject) 
VALUES ('Update profile picture'); -- Priority will be 'Medium'

-- 3. INVALID Usage (This will throw an error or warning)
-- INSERT INTO support_tickets (subject, priority) VALUES ('Broken link', 'Super-High'); 
-- Error: Data truncated for column 'priority'

SELECT * FROM support_tickets;
-- +----+------------------------+----------+--------+
-- | id | subject                | priority | status |
-- +----+------------------------+----------+--------+
-- |  1 | Login Error            | Urgent   | Open   |
-- |  2 | Update profile picture | Medium   | Open   |
-- +----+------------------------+----------+--------+

