-- == ======================================================
-- == Transactions (ACID properties)
-- -- This is the most critical part of Database Design. 
-- -- A transaction ensures that a group of SQL commands either all succeed or all fail.

-- START TRANSACTION --> Begins the recording.
-- COMMIT            --> Saves changes permanently.
-- ROLLBACK          --> Undoes everything if something goes wrong.

DELIMITER //
CREATE PROCEDURE TransferMoney(
    IN p_sender INT, 
    IN p_receiver INT, 
    IN p_amount DECIMAL(10,2)
)
BEGIN
    -- 1. Catch ANY error and Rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Transaction Failed: Changes reverted.' AS status;
    END;
    -- 2. Start the process
    START TRANSACTION;
        -- Subtract from sender
        UPDATE accounts SET balance = balance - p_amount WHERE id = p_sender;
        -- Add to receiver
        UPDATE accounts SET balance = balance + p_amount WHERE id = p_receiver;
        -- Check: If sender balance becomes negative, we can manually trigger an error
        IF (SELECT balance FROM accounts WHERE id = p_sender) < 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient funds';
        END IF;
    -- 3. If we reached here, everything is fine!
    COMMIT;
    SELECT 'Transaction Completed Successfully' AS status;
END //
DELIMITER ;
