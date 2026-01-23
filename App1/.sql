DROP TABLE IF EXISTS products;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    brand VARCHAR(30),
    price DECIMAL(10, 2),
    alternative_product_id INT,
    FOREIGN KEY (alternative_product_id) REFERENCES products(id)
);
INSERT INTO products (name, brand, price, alternative_product_id) VALUES 
('iPhone 15 Pro',    'Apple',   1200,  NULL),
('iPhone 14',        'Apple',   800,   1   ),
('Galaxy S23 Ultra', 'Samsung', 1100,  NULL),
('Galaxy A54',       'Samsung', 400,   3   ),
('Google Pixel 8',   'Google',  700,   NULL),
('Any Phone Else',   'Any',    2700,   NULL);
system clear;
-- == ======================================================
SELECT 
    p.name AS Cheap_Phone,
    p.price AS Cheap_Phone_Price,
    iPhone_15_Pro.price AS iPhone_15_Pro_Price,
    (iPhone_15_Pro.price - p.price) AS Price_Difference
FROM products p, 
     (SELECT price FROM products WHERE name = 'iPhone 15 Pro') AS iPhone_15_Pro
WHERE p.price < iPhone_15_Pro.price;
