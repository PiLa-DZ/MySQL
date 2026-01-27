-- Example 3 ---------------------------------
-- Find customer by first name and last name
DELEMITER $$
CREATE PROCEDURE find_customer_by_full_name (IN f_name VARCHAR(50), IN l_name VARCHAR(50))
BEGIN
    SELECT * FROM customers
    WHERE first_name = f_name AND last_name = l_name;
END $$
DELEMITER ;
-- Call it
CALL find_customer_by_full_name("Larry", "Lobster");

