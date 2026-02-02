1. Logical vs. Physical Backups
    1. Logical Backups (mariadb-dump / mysqldump): 
        - These create a giant .sql file 
        - containing the CREATE TABLE and INSERT 
        - commands needed to rebuild your database.
        1. Pros: Easy to read, works across different versions.
        2. Cons: Slow for massive databases (Terabytes).
    2. Physical Backups: 
        - These copy the actual files on the hard drive.
        1. Pros: Very fast to restore.
        2. Cons: Harder to manage; must be done carefully to avoid data corruption.

2. The Daily Workflow (The Snapshot)
    - In a real job, you would set up a "Cron Job" (a scheduled task) 
        - to run this command every night at 2:00 AM:
    ``` Bash
        # Exporting the entire 'facebook' database to a file
        mariadb-dump -u root -p facebook > facebook_backup_2026_02_02.sql
    ```
    - To Restore it:
    ``` Bash
        # Importing the backup into a fresh database
        mariadb -u root -p facebook_recovery < facebook_backup_2026_02_02.sql
    ```

3. Point-in-Time Recovery (The Binary Log)
    - What if your backup was at 2:00 AM, 
        - but a developer accidentally deleted a table 
        - at 4:00 PM? You would lose 14 hours of data.
    - To solve this, we use Binary Logs (binlogs).
        - The Binary Log records every single change 
            - (INSERT, UPDATE, DELETE) that happens to the database in real-time.
        - Recovery Steps:
            1. Restore the last night's 2:00 AM backup.
            2. "Replay" the Binary Log from 2:00 AM to 3:59 PM.
            3. Stop right before the "Delete" command occurred.

4. The "Backup Strategy" Checklist
    1. Off-site Storage: 
        - Never keep your backups on the same server as your database. 
        - If the server burns down, 
        - you lose both. Send them to 
        - AWS S3, Google Cloud, or another server.
    2. Automation:
        - If a human has to remember to do it, it won't happen. 
        - Automate the process.
    3. Test your Backups: 
        - A backup is useless if it doesn't work. 
        - Once a month, try to restore a backup 
        - to a test server to ensure the file isn't corrupted.
    4. Retention Policy: 
        - How long do you keep backups? 
        - (Daily backups for 7 days, Weekly for 1 month, Monthly for 1 year).

5. Essential Commands for your SQL Notes
```SQL
    -- 1. Check if Binary Logging is enabled
    SHOW VARIABLES LIKE 'log_bin';
    -- 2. View the list of binary log files
    SHOW BINARY LOGS;
    -- 3. The "Help!" Command: See what is happening right now
    -- If someone is running a query that is destroying data, find their ID here
    SHOW PROCESSLIST;
    -- 4. Kill a dangerous process
    -- KILL [ID_from_process_list];
```
