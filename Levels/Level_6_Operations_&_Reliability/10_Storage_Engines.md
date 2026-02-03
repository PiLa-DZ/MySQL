- Summary:
    1. InnoDB: 
        - Use this for 99% of your work. 
        - It's safe, 
        - supports relationships, 
        - and handles many users well.
    2. MyISAM: 
        - Only for very old projects 
        - or extremely simple read-only data.
    3. Memory: 
        - For "Speed over Safety" (temporary data).

- In MariaDB and MySQL, 
    - the Storage Engine is the software component 
    - that handles the actual "reading" and "writing" of data to the disk.

- While the SQL language stays the same, 
    - changing the engine changes how the database behaves—kind 
    - of like putting a racing engine versus 
    - a truck engine into the same car body.

1. How to check your Engines
    - Before we dive in, use this command to see which engines your server supports:
    ```SQL
    SHOW ENGINES;
    /*
    +--------------------+---------+-------------------------------------------------------------------------------------------------+--------------+------+------------+
    | Engine             | Support | Comment                                                                                         | Transactions | XA   | Savepoints |
    +--------------------+---------+-------------------------------------------------------------------------------------------------+--------------+------+------------+
    | MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables                                       | NO           | NO   | NO         |
    | CSV                | YES     | Stores tables as CSV files                                                                      | NO           | NO   | NO         |
    | PERFORMANCE_SCHEMA | YES     | Performance Schema                                                                              | NO           | NO   | NO         |
    | Aria               | YES     | Crash-safe tables with MyISAM heritage. Used for internal temporary tables and privilege tables | NO           | NO   | NO         |
    | MyISAM             | YES     | Non-transactional engine with good performance and small data footprint                         | NO           | NO   | NO         |
    | MRG_MyISAM         | YES     | Collection of identical MyISAM tables                                                           | NO           | NO   | NO         |
    | InnoDB             | DEFAULT | Supports transactions, row-level locking, foreign keys and encryption for tables                | YES          | YES  | YES        |
    | SEQUENCE           | YES     | Generated tables filled with sequential values                                                  | YES          | NO   | YES        |
    +--------------------+---------+-------------------------------------------------------------------------------------------------+--------------+------+------------+
    */
    ```
    - You will see that InnoDB is usually the DEFAULT.

2. The "Big Two" Comparison
    - For a Backend Developer, the choice usually boils down to InnoDB vs. MyISAM.
    ```SQL
    /*
    +----------------+---------------------------------------------------------------------------------------|
    | Feature        | InnoDB (The Modern King)                     | MyISAM (The Old School)                |
    +----------------+---------------------------------------------------------------------------------------|
    | Transactions   | Yes (Supports COMMIT/ROLLBACK)               | No                                     |
    | Locking Level  | Row-level (Only locks the row being changed) | Table-level (Locks the whole table)    |
    | Foreign Keys   | Yes (Enforces relationships)                 | No                                     |
    | Crash Recovery | High (Self-repairs using a redo-log)         | "Low (Tables often get ""corrupted"")" |
    | Primary Use    | "Most web apps, E-commerce, Finance."        | Read-heavy blogs or legacy systems.    |
    +----------------+---------------------------------------------------------------------------------------|
    */
    ```

3. Other Engines you should know
    1. MEMORY (HEAP): 
        - Stores everything in RAM. 
        - It’s incredibly fast but temporary. 
        - If the server restarts, all data is deleted. 
        - Perfect for "Session" data or temporary "Look-up" tables.
    2. CSV: 
        - Stores data in plain text .csv files. 
        - You can actually open the database file 
        - in Excel! It’s useful for importing/exporting data easily.
    3. ARCHIVE: 
        - Highly compressed storage for "Log" data 
        - you rarely read but need to keep for legal reasons. 
        - It only supports INSERT and SELECT (No UPDATE or DELETE).

4. Full Example: Setting the Engine
    - When you create a table, 
    - you can specify the engine. 
    - If you don't, it uses InnoDB.

    ```SQL
        -- 1. Standard InnoDB Table (Recommended)
        CREATE TABLE orders (
            id INT PRIMARY KEY,
            amount DECIMAL(10,2)
        ) ENGINE=InnoDB;
        -- 2. Fast, Temporary Memory Table
        -- Great for a "Who is online" list
        CREATE TABLE current_active_users (
            user_id INT,
            last_action DATETIME
        ) ENGINE=MEMORY;
        -- 3. How to convert an old table to a new engine?
        -- Warning: This can take time on large tables!
        ALTER TABLE old_table_name ENGINE=InnoDB;
    ```

5. Pro-Tip: The "Locking" Nightmare
    - Imagine you have a users table with 1 million rows.
    1. In MyISAM, 
        - if you run UPDATE users SET status = 'active', 
        - the entire table is locked. 
        - No one can even SELECT a username 
        - until the update is finished.
    2. In InnoDB, 
        - only the rows being updated are locked. 
        - Everyone else can keep reading and writing other rows. 
        - This is why we almost always use InnoDB.

