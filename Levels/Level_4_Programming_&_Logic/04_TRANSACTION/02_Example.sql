-- == Example 2 ============================================
-- == If Sender balance empty ==============================
DROP TABLE IF EXISTS bank_accounts;
CREATE TABLE bank_accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50),
    balance DECIMAL(10, 2)
);
INSERT INTO bank_accounts (user_name, balance) VALUES ('Ahmed', 1000), ('Sara', 500);
-- -- ------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE TransferMoney(
    IN sender VARCHAR(50), 
    IN receiver VARCHAR(50), 
    IN amount DECIMAL(10,2)
)
BEGIN
    -- 1. Start the Transaction
    START TRANSACTION;
    -- 2. Try to withdraw money from sender
    UPDATE bank_accounts SET balance = balance - amount WHERE user_name = sender;
    -- 3. Try to deposit money to receiver
    UPDATE bank_accounts SET balance = balance + amount WHERE user_name = receiver;
    -- 4. Simple Logic Check: 
    -- If Ahmed's balance becomes negative, cancel everything!
    IF (SELECT balance FROM bank_accounts WHERE user_name = sender) < 0 THEN
        ROLLBACK;
        SELECT 'Transaction Failed: Insufficient Funds' AS Status;
    ELSE
        COMMIT;
        SELECT 'Transaction Successful' AS Status;
    END IF;
END $$
DELIMITER ;
-- -- ------------------------------------------------------
system clear;
-- To transfer 200 from Ahmed to Sara
CALL TransferMoney('Ahmed', 'Sara', 200.00);
-- Try to transfer 5000 (More than Ahmed has)
CALL TransferMoney('Ahmed', 'Saara', 5000.00);
SELECT * FROM bank_accounts;

