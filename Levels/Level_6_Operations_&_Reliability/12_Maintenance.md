- Summary:
    1. Analyze     : Update the "Map" (Statistics) for the Optimizer.
    2. Optimize    : Deframgent the "Files" (Storage) to save space and speed.
    3. Check/Repair: Fix "Broken" (Corrupted) data.

- as you INSERT, UPDATE, and DELETE millions of rows, 
    - the physical files on the disk become messy (fragmented), 
    - and the database's internal statistics become outdated.

- we will learn the commands that keep the engine running at peak performance.

1. Fragmentation: The "Swiss Cheese" Problem
    - When you delete a row, 
    - the database doesn't usually "shrink" the file on the disk. 
    - It just leaves a "hole" where that row used to be. 
    - Eventually, your table becomes like Swiss cheese—full of holes. 
    - This makes SELECT queries slower because the database has to skip over these empty spaces.

2. The Maintenance Toolkit (SQL)
```SQL
    -- 1. ANALYZE TABLE
    -- Use this when a query that used to be fast suddenly becomes slow.
    -- It updates the "Statistics" so the Optimizer knows which index is best.
    ANALYZE TABLE users;

    -- 2. OPTIMIZE TABLE
    -- The most powerful maintenance command. 
    -- It rebuilds the table to get rid of "holes" (fragmentation) and reclaims disk space.
    -- Note: This can lock the table, so run it during "Low Traffic" hours!
    OPTIMIZE TABLE orders;

    -- 3. CHECK TABLE
    -- Use this if you suspect a table is corrupted (e.g., after a sudden server crash).
    CHECK TABLE products;

    -- 4. REPAIR TABLE
    -- If CHECK TABLE finds errors, this tries to fix them.
    -- (Works mostly for MyISAM; InnoDB usually repairs itself automatically).
    REPAIR TABLE products;
```
3. Monitoring Disk Usage
    - As an admin, 
    - you need to know which tables are "bloated" (taking up too much space). 
    - You can query the information_schema to find out.

    ```SQL
        -- Find the top 5 largest tables in your database
        SELECT 
            table_name AS "Table",
            round(((data_length + index_length) / 1024 / 1024), 2) AS "Size (MB)"
        FROM information_schema.TABLES
        WHERE table_schema = "your_database_name"
        ORDER BY (data_length + index_length) DESC
        LIMIT 5;
    ```

4. Automated Maintenance
    - In big companies, 
    - you don't run these manually. 
    - You use a tool called mysqlcheck from 
    - the command line (Terminal) to handle everything at once.
    ```Bash
        # Optimize all tables in all databases from the terminal
        mysqlcheck -u root -p --optimize --all-databases
    ```
