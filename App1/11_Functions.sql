-- == Example For Test =====================================
CREATE TABLE workers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
	hourly_pay DECIMAL(5, 2)
);

INSERT INTO workers (first_name, last_name, hourly_pay) VALUES 
('Ahmed',  "Amd", 20.00),
('Sara',   "Sra", 26.55),
('Khaled', "Kld", 29.03),
('Laila',  "Lil", 30.00),
('Omar',   "Omr", 19.40);

-- == Count ================================================
-- Get how many rows
SELECT COUNT(id) FROM workers; -- Output: 5
-- Get Maximum hourly_pay
SELECT MAX(hourly_pay) FROM workers; -- Output: 30.00
-- Get Minimum hourly_pay
SELECT MIN(hourly_pay) FROM workers; -- Output: 19.40
-- Get Average hourly_pay
SELECT AVG(hourly_pay) FROM workers; -- Output: 24.99..
-- Get All hourly_pay
SELECT SUM(hourly_pay) FROM workers; -- Output: 124.98
-- Join 2 Column "first_name last_name"
SELECT CONCAT(first_name, " ", last_name) AS full_name FROM workers;
