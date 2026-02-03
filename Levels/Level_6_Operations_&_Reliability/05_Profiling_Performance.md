```SQL
/*
+-----------------------------------------------------------------+
| Summary                                                         |
+-----------------+-----------------------------------------------+
| Profiling:      | Measuring performance.                        |
+-----------------+-----------------------------------------------+
| EXPLAIN:        | Shows the Plan (before running).              |
| SHOW PROFILE:   | Shows the Reality (after running).            |
| Slow Query Log: | Captures the "Slowest" queries automatically. |
+-----------------+-----------------------------------------------+
*/
```

1. Why Profiling?
    - A query might run in 0.01s on your laptop with 10 rows, 
        - but take 5.0s on a server with 1,000,000 rows. 
        - Profiling helps you find:
    1. "Slow Queries" that need an index.
    2. Queries that are doing a "Full Table Scan" (reading every single row).
    3. Hidden delays like "Sending data" or "Waiting for locks."

2. The Profiler Toolkit (SQL)
```SQL
-- 1. Enable the Profiler (It's off by default to save resources)
SET profiling = 1;

-- 2. Run your "Slow" query
SELECT * FROM orders WHERE total_amount > 500;

-- 3. Show a list of all recently run queries and their total time
SHOW PROFILES;

-- 4. Get a detailed breakdown of the LAST query (Query ID 1)
-- This shows exactly what happened: "Opening tables", "Sorting", "Statistics", etc.
SHOW PROFILE FOR QUERY 1;

-- 5. Show CPU usage for that query
SHOW PROFILE CPU FOR QUERY 1;
```

3. The "Slow Query Log"
    - In a real production environment 
        - (like a Node.js app on a Linux server),
        - you can't manually run SHOW PROFILES all day. 
        - Instead, we use the Slow Query Log.
    - You configure the database to say: 
        - "If any query takes longer than 2 seconds, 
        - write it down in a special text file 
        - so I can look at it later."
    ```SQL
    -- How to enable the Slow Query Log via SQL
    SET GLOBAL slow_query_log = 'ON';
    SET GLOBAL long_query_time = 2.0; -- Seconds
    ```

4. Integration with Node.js
    - As a Node.js dev, 
        - you can profile from the "outside" using your code. 
        - Most Node.js DB libraries (like mysql2 or Prisma) 
        - allow you to log the execution time.
    - Pro-Tip: 
        - If your Node.js console shows a query taking 200ms, 
        - but the Database Profile shows it took only 5ms, 
        - the problem is your Network or Node.js processing, not the SQL!
