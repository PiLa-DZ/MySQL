-- == ======================================================
-- == Loops (WHILE and LOOP)
-- -- Sometimes you need to repeat an action. 
-- -- While we try to avoid loops in SQL 
--    (because set-based operations are faster), 
-- -- they are useful for tasks like generating 
--    test data or processing complex reports.

-- == ======================================================
-- 1. The WHILE Loop (The Most Popular)
DELIMITER //
CREATE PROCEDURE PopulateUsers()
BEGIN
    DECLARE counter INT DEFAULT 1;
    WHILE counter <= 10 DO
        INSERT INTO users (username) VALUES (CONCAT('user_', counter));
        SET counter = counter + 1; -- Don't forget this, or you get an infinite loop!
    END WHILE;
    SELECT '10 users created!' AS result;
END //
DELIMITER ;

-- == ======================================================
-- 2. The LOOP and LEAVE (The "Break" Strategy)
DELIMITER //
CREATE PROCEDURE LoopExample()
BEGIN
    DECLARE x INT DEFAULT 0;
    -- We give the loop a label name 'my_loop'
    my_loop: LOOP
        SET x = x + 1;
        IF x >= 5 THEN
            LEAVE my_loop; -- This is exactly like 'break' in JS
        END IF;
        -- You can also use ITERATE to skip to the next turn (like 'continue')
        IF x = 2 THEN
            ITERATE my_loop; 
        END IF;
        INSERT INTO logs (val) VALUES (x);
    END LOOP my_loop;
END //

-- == ======================================================
-- The REPEAT loop is the SQL cousin of the do...while loop in JavaScript.
DELIMITER //
CREATE PROCEDURE ClearStock(IN p_min_stock INT)
BEGIN
    DECLARE current_stock INT;
    -- Get current count
    SELECT quantity INTO current_stock FROM inventory WHERE id = 1;
    REPEAT
        -- Action: Remove 1 item
        UPDATE inventory SET quantity = quantity - 1 WHERE id = 1;
        SET current_stock = current_stock - 1;
        
    UNTIL current_stock <= p_min_stock
    END REPEAT;
    SELECT 'Stock cleared to minimum level' AS status;
END //
DELIMITER ;
