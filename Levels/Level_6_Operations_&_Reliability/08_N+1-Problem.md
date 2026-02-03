```SQL
/*
+---------------+-------------------------------+----------------------------+
| Feature       | The N+1 Way (Lazy)            | The Optimized Way (Eager)  |
+---------------+-------------------------------+----------------------------+
| Queries       | 1 (Categories) + N (Products) | 1 (Join) or 2 (IN clause)  |
| Speed         | Very slow as data grows       | Consistent and fast        |
| Database Load | High (Many connections)       | Low (Efficient processing) |
| Code Style    | Loop with queries inside      | JOIN or bulk fetching      |
+----------------------------------------------------------------------------+
*/
```

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

2. The "Bad" Way (The N+1 Trap)
    - In a backend app (Node, PHP, Python), 
    - a junior developer might write code that does this:
    ``` SQL
        -- STEP 1: Get all categories (This is the "1" in N+1)
        SELECT * FROM categories; 
        -- Result: 3 categories found.

        -- STEP 2: The Loop (This is the "N" in N+1)
        -- The code loops through each category and runs a NEW query:
        SELECT * FROM products WHERE category_id = 1; -- Query for Electronics
        SELECT * FROM products WHERE category_id = 2; -- Query for Clothing
        SELECT * FROM products WHERE category_id = 3; -- Query for Home
    ```
    - The Problem: 
        - If you have 1,000 categories, 
        - your database receives 1,001 separate requests. 
        - This creates massive "latency" (back-and-forth travel time).

3. The "Good" Way (JOIN / Eager Loading)
    - As a Senior Dev, 
        - you solve this by getting all the data in one single trip to the database.
    1. Option A: The SQL JOIN (The most efficient)
        ``` SQL
            -- This is 1 Query. Total. 
            -- No matter how many categories exist, it stays as 1 Query.
            SELECT 
                c.name AS category, 
                p.name AS product
            FROM categories c
            LEFT JOIN products p ON c.id = p.category_id;
        ```
    2. Option B: The IN Clause (Often used by ORMs)
        - If your application logic requires you to keep the categories 
        - and products separate, you use two queries:
        ``` SQL
            -- Query 1: Get Categories
            SELECT * FROM categories; -- Returns IDs: 1, 2, 3
            -- Query 2: Get all products for those IDs in one go
            SELECT * FROM products WHERE category_id IN (1, 2, 3);
        ```
    - The Result: Even with 1 million categories, 
        - this only takes 2 queries. 
        - This is called Eager Loading.

4. Pro-Tip: How to catch this in the wild
    - If you are looking at your Database Logs 
        - and you see the exact same query repeating 
        - over and over with only the ID changing: 
        - SELECT * FROM comments WHERE post_id = 101; 
        - SELECT * FROM comments WHERE post_id = 102; 
        - SELECT * FROM comments WHERE post_id = 103;
    - Stop! You have an N+1 problem. 
        - Wrap those IDs into an IN (...) or use a JOIN.
