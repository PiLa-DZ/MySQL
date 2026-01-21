-- == Backup Table Data ====================================
-- NOTE: You can just backup Data Not Table Not Database
-- If you drop table or database you can't backup
-- Stop Auto Commit
SET AUTOCOMMIT = OFF;
-- Set WayPoint
COMMIT;
-- Return to WayPoint
ROLLBACK;
-- == ======================================================

-- == NOT NULL =============================================
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(25),
    age INT NOT NULL
);
-- Add to the comumn
ALTER TABLE users MODIFY age INT NOT NULL;
-- == ======================================================
