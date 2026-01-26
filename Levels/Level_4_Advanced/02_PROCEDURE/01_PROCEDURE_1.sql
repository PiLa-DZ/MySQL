-- Stored procedure -->
-- is prepared SQL code that you can save
-- great if there's a query that you write often

-- It's like a block of code you can call it any time in your code
-- Example 1 ---------------------------------
DELIMITER $$
CREATE PROCEDURE get_customers()
BEGIN
    SELECT * FROM customers;
END $$
DELIMITER ;

-- To use this block of code
CALL get_customers();
-- To DELETE it
DROP PROCEDURE get_customers;


