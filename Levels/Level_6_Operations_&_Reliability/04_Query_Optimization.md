1. The Detective's Tool: EXPLAIN
    - In MariaDB/MySQL, you don't guess—you use EXPLAIN. 
    - By putting this keyword before your SELECT, the database tells you its "Execution Plan."
    ``` SQL
        EXPLAIN SELECT * FROM users WHERE email = 'test@example.com';
    ```
    - What to look for in the results:
        - type: This is the most important column.
            - const or eq_ref: Excellent (Found 1 match immediately).
            - ref or range   : Good      (Used an index to find a group of rows).
            - ALL            : Terrible  (Full Table Scan—it read every single row).
        - key: Tells you which index the database actually chose.
        - rows: How many rows the database thinks it has to look at. If this is 1,000,000, you have a problem.

2. Common Optimization Scenarios
    1. The "Wildcard" Trap
        - Using a % at the beginning of a string disables the index.
            - ❌ Slow: WHERE username LIKE '%ahmed' (Database must scan everything).
            - ✅ Fast: WHERE username LIKE 'ahmed%' (Database can use the index).
    2. Avoiding SELECT *
        - In big tables, SELECT * is heavy because it pulls data from the disk for every single column.
            - ✅ Optimized: Only select the columns you actually need. 
                - SELECT id, username FROM users WHERE status = 'active';
    3. The "Function on a Column" Mistake
        - If you wrap a column in a function, the database cannot use the index on that column.
            - ❌ Slow: WHERE YEAR(created_at) = 2024
            - ✅ Fast: WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31'

3. Practical Example: Optimizing a Join
    - Joins are where most performance issues happen. 
    - Usually, the issue is a missing index on the Foreign Key.
    ``` SQL
        -- == Optimization Practice ==

        -- 1. The Unoptimized Query
        -- If orders.customer_id is NOT indexed, this is a nightmare.
        EXPLAIN SELECT customers.name, orders.order_date 
        FROM customers 
        JOIN orders ON customers.id = orders.customer_id;

        -- 2. The Fix
        CREATE INDEX idx_orders_customer_id ON orders(customer_id);

        -- 3. Run EXPLAIN again
        -- You will see the 'type' change from 'ALL' to 'ref'.
    ```

4. Advanced: Summary Table (Materialized Logic)
    - If you have a query that calculates the sum of 10 million rows every time a user logs in, even an index won't save you.
    - Strategy: Create a "Summary Table" (e.g., daily_revenue_totals).
    - Action: Use a Scheduled Task or a Trigger to update the summary table, 
        - then query the small summary table instead of the 10-million-row table.

5. Summary Checklist for your Notes:
    1. Always EXPLAIN slow queries.
    2. Avoid ALL in the type column.
    3. Index Foreign Keys used in Joins.
    4. Avoid leading wildcards (%text).
    5. Don't use functions on indexed columns in the WHERE clause.
