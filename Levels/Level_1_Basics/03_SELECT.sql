-- == Trick ================================================
SELECT "Hello Wourld" AS Message

-- == All | Many ===========================================
SELECT * FROM users;
SELECT name, age FROM users;

-- == Column Alias =========================================
SELECT first_name AS Name, age AS User_Age FROM users;

-- == Filter Repeated Rows =================================
SELECT DISTINCT name FROM users; -- Don't Repeat names (Rows)

-- == Aggregate Functions ==================================
SELECT COUNT(id)       FROM workers; -- Get how many rows
SELECT MAX(hourly_pay) FROM workers; -- Get Maximum hourly_pay
SELECT MIN(hourly_pay) FROM workers; -- Get Minimum hourly_pay
SELECT AVG(hourly_pay) FROM workers; -- Get Average hourly_pay
SELECT SUM(hourly_pay) FROM workers; -- Get All hourly_pay

-- == String Functions (Text Manipulation) =================
SELECT CONCAT(name1, " ", name2) AS full_name FROM workers; -- Join 2 Column
