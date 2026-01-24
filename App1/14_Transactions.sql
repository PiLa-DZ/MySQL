-- 4 ACID Rules
-- -- 1. Atomicity
-- -- 2. Consistency
-- -- 3. Isolation
-- -- 4. Durability
-- 3 Code
-- -- 1. START TRANSACTION:
-- -- 2. COMMIT:
-- -- 3. ROLLBACK:

-- == Example 1 ============================================
-- == Just for show ========================================
-- 1. Setup tables
DROP TABLE IF EXISTS bank_accounts;
CREATE TABLE bank_accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50),
    balance DECIMAL(10, 2)
);
INSERT INTO bank_accounts (user_name, balance) VALUES ('Ahmed', 1000), ('Sara', 500);
-- 2. Start the transaction
START TRANSACTION;
-- Step 1: Withdraw money from Ahmed
UPDATE bank_accounts SET balance = balance - 200 WHERE user_name = 'Ahmed';
-- Step 2: Deposit money to Sara
UPDATE bank_accounts SET balance = balance + 200 WHERE user_name = 'Sara';
-- If everything is OK:
COMMIT;
-- If you made a mistake (e.g., withdrew more than available):
-- ROLLBACK;

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
system clear;
-- -- ------------------------------------------------------
-- To transfer 200 from Ahmed to Sara
CALL TransferMoney('Ahmed', 'Sara', 200.00);
-- Try to transfer 5000 (More than Ahmed has)
CALL TransferMoney('Ahmed', 'Saara', 5000.00);
SELECT * FROM bank_accounts;

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
