- Summary:
    - Isolation means: Separation.
    - The Goal: 
        - Prevent transactions from seeing "half-finished" 
        - work from other transactions.
    - The Trade-off: 
        - Higher Isolation = Higher Safety, 
        - but Slower Performance (because users have to wait for locks).

1. The Problem:
    - In a real-world Node.js app, 
    - you don't have just one user. 
    - You might have 1,000 users 
    - all clicking buttons at the exact same time. 
    - Isolation is the database's way 
    - of making sure that even 
    - though 1,000 things are happening at once, 
    - they don't mess each other up.

2. The Problem Isolation Solves: "Dirty Reads"
    - To understand why we need Isolation, 
        - you need to see what happens when it's missing.
    - Scenario: Two people looking at a flight seat.
        1. User A starts a transaction 
            - to book the last seat. 
            - The database marks the seat as "Taken."
        2. User B comes along. 
            - If there is No Isolation, 
            - User B sees the seat is "Taken" and leaves the site.
        3. User A's credit card is declined! 
            - User A's transaction Rolls Back. 
            - The seat is actually "Available" again.
        4. The Problem: 
            - User B saw "Dirty" data 
            - (data that wasn't finalized). 
            - User B was lied to.

3. The 4 Levels of Isolation
    - Not every app needs the same amount of "strictness." 
        - SQL gives you 4 levels of Isolation 
        - (from "Relaxed" to "Strict"):
    ```SQL
    +------------------+------------+-----------------------------------------+
    | Level            | Strictness | Behavior                                |
    +------------------+------------+-----------------------------------------+
    | Read Uncommitted | 0%         | You can see other people's "drafts"     |
    |                  |            | (Dirty Reads). ❌Very Dangerous.        |
    +------------------+------------+-----------------------------------------+
    | Read Committed   | 50%        | You only see data once the other        |
    |                  |            | person clicks ""Save"" (Commit).        |
    +------------------+------------+-----------------------------------------+
    | Repeatable Read  | 80%        | (Default in MariaDB) If you read a row, |
    |                  |            | it won't change even if someone else    |
    |                  |            | updates it while you're still looking.  |
    +------------------+------------+-----------------------------------------+
    | Serializable     | 100%       | Everyone waits in a single line.        |
    |                  |            | One by one. Very Slow but 100% Safe.    |
    +------------------+------------+-----------------------------------------+
    ```

4. Why this matters for Node.js Developers
    - Since Node.js is Asynchronous, 
        - it’s very easy to accidentally 
        - trigger two database calls at the same time.
    - If you are building a Stock Market app 
        - or a Crypto Exchange, 
        - you need high Isolation (Repeatable Read or Serializable) 
        - because prices change every millisecond. 
        - If you are building a Blog, Read Committed is usually enough.
