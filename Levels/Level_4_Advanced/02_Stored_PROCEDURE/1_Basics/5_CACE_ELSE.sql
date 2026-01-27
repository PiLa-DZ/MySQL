-- == Syntax ===============================================
CASE column_name
    WHEN 'Value1' THEN 'Result1'
    WHEN 'Value2' THEN 'Result2'
    ELSE 'DefaultResult'
END

-- == Example 2 ============================================
-- Let's say you have a status column with numbers (0, 1, 2) and you want to show readable text.
SQL

SELECT username,
    CASE status
        WHEN 0 THEN 'Pending'
        WHEN 1 THEN 'Active'
        WHEN 2 THEN 'Suspended'
        ELSE 'Unknown'
    END AS user_status
FROM users;

-- == Example 3 ============================================
-- Categorizing users based on their account balance.
SELECT username, balance,
    CASE 
        WHEN balance > 10000 THEN 'Whale 🐋'
        WHEN balance > 1000  THEN 'Dolphin 🐬'
        WHEN balance > 0     THEN 'Shrimp 🦐'
        ELSE 'Empty Account 🚫'
    END AS investor_type
FROM accounts;

-- == ======================================================
-- Example (In a regular Query):
SELECT username,
    CASE 
        WHEN balance > 1000 THEN 'Gold Member'
        WHEN balance > 500  THEN 'Silver Member'
        ELSE 'Regular Member'
    END AS member_type
FROM accounts;
