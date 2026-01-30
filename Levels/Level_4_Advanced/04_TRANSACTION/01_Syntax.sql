-- == Syntax ===============================================
-- == ======================================================
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

