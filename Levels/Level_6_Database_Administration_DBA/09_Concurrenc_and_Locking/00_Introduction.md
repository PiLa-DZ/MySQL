- Summary:
    1. Concurrency   : Handling many users at once.
    2. Shared Lock   : "I'm reading, don't change this."
    3. Exclusive Lock: "I'm changing this, don't look/touch."
    3. Deadlock      : A circular wait that the DB must resolve.

- This is the "Traffic Control" of the database. 
    - Concurrency is the ability of the database 
    - to handle multiple users at the same time, 
    - and Locking is the mechanism used 
    - to prevent them from stepping on each other's toes.

- Without locking, 
    - if two people tried to withdraw the last 100$ 
    - from an ATM at the exact same millisecond, 
    - the bank might accidentally give out 200$.

1. The Two Types of Locks
    1. Shared Locks (S-Locks / Read Locks)
        1. What it does: 
            - Allows multiple users to Read a row 
            - but prevents anyone from Writing to it.
        2. Analogy: 
            - Multiple people can read the same book 
            - at the library at the same time, 
            - but no one can rip out a page while someone is reading.
    2. Exclusive Locks (X-Locks / Write Locks)
        1. What it does: 
            - Prevents any other user from 
            - both Reading and Writing to that row.
        2. Analogy: 
            - If you are writing in a notebook, 
            - you have "Exclusive" access. 
            - No one else can read it or write in it until you are finished.

2. The Granularity (How much are we locking?)
    - As we discussed in Storage Engines, 
        - the "size" of the lock matters:
    1. Table-level Lock: 
        - Locks the entire table (Common in MyISAM). 
        - Very slow for many users.
    2. Row-level Lock: 
        - Locks only the specific row being changed (Common in InnoDB). 
        - Very fast.

3. The "Deadlock" (The Database Traffic Jam)
    - A deadlock happens when two transactions 
        - are waiting for each other to release a lock.
    1. Transaction 1: Locks Row A, then asks for Row B.
    2. Transaction 2: Locks Row B, then asks for Row A.
    3. Result       : They wait forever.
    4. Solution     : 
        - The database (InnoDB) is smart enough to detect this. 
        - It will automatically "Kill" one of the transactions 
        - so the other can finish.

4. Practical SQL: Controlling Locks
    - Usually, the database handles locks automatically. 
        - However, as a Backend Developer, 
        - sometimes you need to manually lock a row 
        - for safety (e.g., in a banking app).

    ```SQL
        -- 1. "Select for Update" (Exclusive Lock)
        -- This tells the DB: "I am reading this row and I intend to change it soon. 
        -- Don't let anyone else touch it until I am done."
        START TRANSACTION;

        SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;

        -- (Perform your calculations in the backend code)
        UPDATE accounts SET balance = balance - 100 WHERE id = 1;

        COMMIT; -- The lock is released only when you COMMIT or ROLLBACK.

        -- 2. Check for current locks and waits
        -- This is a life-saver when your app feels "stuck"
        SELECT * FROM information_schema.innodb_trx;
        SELECT * FROM information_schema.innodb_locks;
        SELECT * FROM information_schema.innodb_lock_waits;
    ```

5. Optimistic vs. Pessimistic Locking
    - These are two strategies used in Backend development:
    1. Pessimistic Locking: 
        - You assume the worst (that someone will try to change the data). 
        - You use FOR UPDATE to lock the row as soon as you read it. 
        - (Safe, but slower).
    2. Optimistic Locking: 
        - You don't use database locks. 
        - Instead, you check if the data has changed 
        - since you read it (usually by checking a version column). 
        - If it changed, you cancel the update 
        - and try again. (Faster, better for high-traffic apps).
