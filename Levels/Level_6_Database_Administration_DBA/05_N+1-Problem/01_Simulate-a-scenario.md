1. The Setup
    - First, let's create a simple One-to-Many relationship.
    ``` SQL
        CREATE TABLE categories (
            id INT PRIMARY KEY AUTO_INCREMENT,
            name VARCHAR(50)
        );

        CREATE TABLE products (
            id INT PRIMARY KEY AUTO_INCREMENT,
            name VARCHAR(50),
            category_id INT,
            FOREIGN KEY (category_id) REFERENCES categories(id)
        );

        INSERT INTO categories (name) VALUES ('Electronics'), ('Clothing'), ('Home');
        INSERT INTO products (name, category_id) VALUES 
        ('Laptop', 1), ('Phone', 1), ('Shirt', 2), ('Lamp', 3);
    ```
