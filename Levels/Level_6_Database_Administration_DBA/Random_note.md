-- == ======================================================
DCA (Database Control / Administrator Assistant)
If you specifically saw DCA, it usually refers to one of two things:
1. Docker Certified Associate: (Common in DevOps) People who manage databases inside "Docker Containers."
2. Database Control Agent: A background process or tool that monitors the database.
3. Database Certified Associate: An entry-level certification for people starting their journey to becoming a full DBA.

-- == ======================================================
- Pro-Tip: The "Monitoring" Mindset
    - In administration, 
    - you need to see what's happening right now.
    - Use this command to see all active connections and what they are doing:
    ```SQL
        SHOW PROCESSLIST;
    ```
    +----+-------+-----------+----------+---------+------+----------+------------------+----------+
    | Id | User  | Host      | db       | Command | Time | State    | Info             | Progress |
    +----+-------+-----------+----------+---------+------+----------+------------------+----------+
    | 10 | admin | localhost | facebook | Query   |    0 | starting | SHOW PROCESSLIST |    0.000 |
    +----+-------+-----------+----------+---------+------+----------+------------------+----------+
