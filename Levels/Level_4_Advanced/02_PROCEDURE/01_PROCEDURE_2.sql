-- Example 2 ---------------------------------
-- You can also use arguments
DELIMITER $$
BEGIN
CREATE PROCEDURE find_customer(IN id INT)
    SELECT * FROM customers
    WHERE customer_id = id;
END $$
DELIMITER ;
-- So now you can find customer by id
CALL find_customer(1);
CALL find_customer(2);
CALL find_customer(3);
CALL find_customer(4);
