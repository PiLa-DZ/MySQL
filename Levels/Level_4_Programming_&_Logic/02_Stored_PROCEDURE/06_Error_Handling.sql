-- == ======================================================
-- == Error Handling (HANDLERS)
-- -- In JavaScript, you use try { ... } catch (e) { ... }. 
-- -- In SQL, you use Handlers. 
-- -- This allows your procedure to catch errors (like a duplicate email) 
--    and handle them gracefully instead of just crashing.

-- DECLARE EXIT HANDLER     --> Catch the error and stop the procedure.
-- DECLARE CONTINUE HANDLER --> Catch the error and keep going.

-- == Example 1 ============================================
-- DECLARE EXIT HANDLER     --> Catch the error and stop the procedure.
DELIMITER //
CREATE PROCEDURE TransactionalInsert()
BEGIN
    -- If ANY error occurs, stop (EXIT) and rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'A database error occurred. Transaction rolled back.' AS error;
    END;
    START TRANSACTION;
        INSERT INTO table1 ...;
        INSERT INTO table2 ...;
    COMMIT;
END //

-- == Example 2 ============================================
-- DECLARE EXIT HANDLER     --> Catch the error and stop the procedure.
DELIMITER //
CREATE PROCEDURE SafeAddUser(IN p_username VARCHAR(50), IN p_email VARCHAR(100))
BEGIN
    -- 1. Create a variable to track if an error happened
    DECLARE email_exists INT DEFAULT 0;
    -- 2. Declare the Handler
    -- 1062 is the MySQL error code for "Duplicate Entry"
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
        SET email_exists = 1;
    END;
    -- 3. Try the insert
    INSERT INTO users (username, email) VALUES (p_username, p_email);
    -- 4. Check our variable
    IF email_exists = 1 THEN
        SELECT 'Error: This email is already registered!' AS message;
    ELSE
        SELECT 'User added successfully!' AS message;
    END IF;
END //
DELIMITER ;
