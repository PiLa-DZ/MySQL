-- == Example 3 ============================================
-- == If Sender balance empty ==============================
-- == If Receiver Not found ================================
DROP TABLE IF EXISTS bank_accounts;
DROP PROCEDURE IF EXISTS SafeTransfer;
CREATE TABLE bank_accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50),
    balance DECIMAL(10, 2)
);
INSERT INTO bank_accounts (user_name, balance) VALUES ('Ahmed', 1000), ('Sara', 500);
-- -- ------------------------------------------------------
DELIMITER //
CREATE OR REPLACE PROCEDURE SafeTransfer(
    IN sender_name VARCHAR(50), 
    IN receiver_name VARCHAR(50), 
    IN amount DECIMAL(10,2)
)
BEGIN
    IF EXISTS (SELECT 1 FROM bank_accounts WHERE user_name = receiver_name) THEN
        START TRANSACTION;
        UPDATE bank_accounts SET balance = balance - amount WHERE user_name = sender_name;
        UPDATE bank_accounts SET balance = balance + amount WHERE user_name = receiver_name;
        IF (SELECT balance FROM bank_accounts WHERE user_name = sender_name) >= 0 THEN
            COMMIT;
            SELECT 'Success: Transfer Completed' AS Status;
        ELSE
            ROLLBACK;
            SELECT 'Failed: Insufficient Funds' AS Status;
        END IF;
    ELSE
        SELECT 'Error: Receiver Account Not Found' AS Status;
    END IF;
END //
DELIMITER ;
system clear;
-- -- ------------------------------------------------------
CALL SafeTransfer('Any user', 'ansns', 200.00);
