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
