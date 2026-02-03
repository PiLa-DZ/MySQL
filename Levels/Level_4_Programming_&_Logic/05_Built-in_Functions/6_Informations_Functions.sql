-- 6. (Information Functions) or (Scalar Functions)
USER();           -- Tells you who is currently logged in.
DATABASE();       -- Tells you which database you are currently using.
VERSION();        -- Tells you the version of MySQL you are running.
LAST_INSERT_ID(); -- Tells you the last generated ID.

-- == LAST_INSERT_ID() =====================================
-- It acts like a "global memory" that remembers 
-- the most recent AUTO_INCREMENT ID generated 
-- by your current connection.
SELECT LAST_INSERT_ID();
-- +------------------+
-- | LAST_INSERT_ID() |
-- +------------------+
-- |                3 |
-- +------------------+

-- == USER() ===============================================
SELECT USER();
-- +-----------------+
-- | USER()          |
-- +-----------------+
-- | admin@localhost |
-- +-----------------+

-- == DATABASE() ===========================================
SELECT DATABASE();
-- +------------+
-- | DATABASE() |
-- +------------+
-- | Google_DB  |
-- +------------+

-- == VERSION() ============================================
SELECT VERSION();
-- +----------------+
-- | VERSION()      |
-- +----------------+
-- | 12.1.2-MariaDB |
-- +----------------+
