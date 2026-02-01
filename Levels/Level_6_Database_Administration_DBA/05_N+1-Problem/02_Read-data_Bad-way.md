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
