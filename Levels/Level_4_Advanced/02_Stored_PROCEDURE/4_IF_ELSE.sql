-- == If Statement =========================================
-- NOTE: You cannot use the IF statement everywhere.
-- NOTE: - You can use it Only inside Stored Programs 
--         (Procedures, Triggers, Functions).
--       - To decide which "blocks" of code to execute.
--       - IF ... THEN ... ELSE ... END IF;
-- ❌ You cannot do this in a regular SELECT: > SELECT IF age > 18 THEN 'Adult' END IF FROM users; (ERROR)

-- -- ------------------------------------------------------
-- Basic Syntax
IF condition THEN
    -- code to run if true
ELSEIF other_condition THEN
    -- code to run if the first was false
ELSE
    -- code to run if nothing matched
END IF;

-- == If() Function ========================================
-- == The IF() Function (The "Expression" one)
-- 1. This is a built-in function, similar to the Ternary Operator 
--    (condition ? true : false) in JavaScript.
-- 2. You can use it Anywhere! Inside SELECT, UPDATE, INSERT, and even inside Procedures.
-- 3. To return one of two values based on a condition.
-- 4. Syntax: IF(condition, value_if_true, value_if_false)

-- Example (In a regular Query):
SELECT username, IF(balance > 100, 'Rich', 'Poor') AS status 
FROM accounts;


-- == Practical Example ====================================
DELIMITER //
CREATE PROCEDURE CheckUserStatus(IN p_user_id INT)
BEGIN
    DECLARE post_count INT;
    DECLARE user_status VARCHAR(20);
    -- 1. Get the number of posts for this user
    SELECT COUNT(*) INTO post_count FROM posts WHERE user_id = p_user_id;
    -- 2. Logic to decide status
    IF post_count > 50 THEN
        SET user_status = 'Elite';
    ELSEIF post_count > 10 THEN
        SET user_status = 'Active';
    ELSE
        SET user_status = 'Newbie';
    END IF;
    -- 3. Return the result
    SELECT CONCAT('User level is: ', user_status) AS result;
END //
DELIMITER ;
