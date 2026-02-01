1. Types of Indexing Strategies:
    1. Single-Column Index
        - Used for columns you search by frequently (e.g., searching for a user by their email).
        ``` SQL
            -- Standard Index for fast lookups
            CREATE INDEX idx_user_email ON users(email);
        ```
    2. Composite Index (The "Pro" Choice)
        - This is an index on multiple columns. This is vital when your WHERE clause uses more than one filter.
        - Rule of Thumb: The order of columns matters! Always put the most specific column first.
        ``` SQL
            -- If you often search for orders by a specific customer AND a specific date
            CREATE INDEX idx_customer_order_date ON orders(customer_id, order_date);
        ```
    3. Covering Index
        - A covering index is a strategy where the index contains all the data the query needs.
            - If you SELECT email FROM users WHERE email = '...',
            - the database doesn't even have to look at the actual table; 
            - it gets the answer directly from the index.
2. Full Example: Performance Testing
    ``` SQL
    -- Let's assume a table with 1,000,000 rows
    CREATE TABLE big_data_table (
        id INT PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        city VARCHAR(50),
        salary DECIMAL(10,2)
    );
    -- 1. Create a Composite Index
    -- Use this if you frequently run: SELECT * FROM big_data_table WHERE city = 'Algiers' AND last_name = 'Ahmed';
    CREATE INDEX idx_city_lastname ON big_data_table(city, last_name);
    -- 2. Create a Prefix Index (Save space on long strings)
    -- Instead of indexing the whole 255 chars, we only index the first 10
    ALTER TABLE big_data_table ADD INDEX idx_name_prefix (first_name(10));
    -- 3. How to check if your index is actually working?
    -- Use the EXPLAIN keyword!
    EXPLAIN SELECT * FROM big_data_table 
    WHERE city = 'Algiers' AND last_name = 'Ahmed';

    ```
3. The "Golden Rules" of Indexing
    - Don't Over-Index: 
        - Every index makes SELECT faster but makes INSERT, UPDATE, and DELETE slower 
        - (because the database has to update the index every time the data changes).
    - Index the "Selectivity": 
        - Index columns that have many unique values (like email). 
        - Don't index columns with only 2 values (like gender), 
        - as the database will likely ignore the index anyway.
    - The Left-to-Right Rule: 
        - If you have a composite index on (city, last_name), 
        - it will speed up searches for city alone, 
        - but it will not speed up searches for last_name alone.

4. How to see your indexes
    - To see all the indexes currently active on a table:
    ``` SQL
        SHOW INDEX FROM big_data_table;
    ```
5. Summary:
    1. Primary Key:  Automatic unique index.
    2. INDEX:        Speeds up searching.
    3. UNIQUE INDEX: Speeds up searching AND prevents duplicates.
    4. EXPLAIN:      The tool to verify if your strategy is working.
