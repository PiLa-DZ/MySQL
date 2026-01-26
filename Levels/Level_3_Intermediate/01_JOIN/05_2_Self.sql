-- Practice (Self JOIN)
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
('Google Pixel 8',   'Google',  700,   NULL);

system clear;
-- == ======================================================
select 
    old_phone.name AS Old_Phone,
    old_phone.price AS Price, 
    new_phone.name AS New_Phone,
    (new_phone.price - old_phone.price) AS Price_Difference
FROM products old_phone
JOIN products new_phone
ON old_phone.alternative_product_id = new_phone.id
ORDER BY Price_Difference DESC;

/* == Your Task ============================================
- Write a Self Join query that displays a list of 
      cheaper products and the name of 
      their "more powerful" (alternative) product.

- The result should be displayed as follows:
1 - Name of the cheaper product (iPhone 14).
2 - Its price.
3 - Name of the more expensive alternative product (iPhone 15 Pro).
4 - The price difference between them (subtraction).

- Additional conditions to increase the challenge:
-- Use clear aliases ("cheap" for the first version and "premium" for the second).
-- Only display products that have an alternative (do not display products without an alternative product ID).
-- Sort the results so that the largest price difference appears first.
*/

