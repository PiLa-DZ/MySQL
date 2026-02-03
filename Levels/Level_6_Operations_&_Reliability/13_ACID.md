# Summary
```SQL
/*
+-------------+----------------+------------------------------------------+
| Property    | Keyword        | Real-World Meaning                       |
+-------------+----------------+------------------------------------------+
| Atomicity   | All or Nothing | "No ""half-finished"" transfers."        |
+-------------+----------------+------------------------------------------+
| Consistency | Rules          | No broken constraints or illegal data.   |
+-------------+----------------+------------------------------------------+
| Isolation   | Privacy        | Transactions don't trip over each other. |
+-------------+----------------+------------------------------------------+
| Durability  | Permanent      | "Once saved, it stays saved forever."    |
+-------------+----------------+------------------------------------------+
*/
```

# Atomicity
- Atomicity --> the "All or Nothing"
1. What is Atomicity?
    - The Golden Rule of Atomicity: 
        - Either EVERYTHING inside the transaction happens, 
        - or NOTHING happens at all. There is no "middle ground."

2. The "Bank Transfer" Story (The Best Way to Understand)
    - Imagine you want to send $100 
    - to your friend. 
    - This requires two separate actions in the database:
        1. Subtract $100 from your account.
        2. Add $100 to your friend's account.
    - ❌ Without Atomicity (The Disaster)
        1. The database subtracts $100 from you.
        2. CRASH! The power goes out or the server restarts before step 2 happens.
        3. Result: 
            - Your $100 is gone forever, 
            - and your friend never got it. 
            - The money vanished into thin air.
    - ✅ With Atomicity (The Solution)
        1. You wrap both steps in START TRANSACTION.
        2. The database subtracts $100 from you.
        3. The server crashes.
        4. Result: 
            - Because the transaction never reached COMMIT, 
            - the database automatically rolls back. 
            - Your $100 is returned to your account. 
            - It's like the mistake never happened.

# Consistency
- Consistency --> 
    - the database’s way of saying: 
    - "I will never allow you to break my rules."

1. Consistency vs. Atomicity (The Difference)
    - People often confuse these two. Here is the best way to remember:
    1. Atomicity  : Focuses on the Process (Did all steps finish?).
    2. Consistency: Focuses on the Rules (Is the data legal?).

2. The Bank Example again: 
    - Imagine you have a rule (Constraint) 
    - that a balance cannot be less than $0.
    1. You have $50.
    2. You try to send $100 to a friend.
    3. Atomicity would allow this (it's a complete step).
    4. Consistency steps in and says: 
        - Wait! This transaction would result in -$50, 
        - which breaks my rule. 
        - I am canceling this entire transaction right now.

# Isolation
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
    /*
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
    */
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

# Durability
- Durability --> Once saved, it stays saved forever.

1. The Core Concept
    - Durability guarantees that once a transaction is Committed, 
        - it is permanently saved. 
        - Even if the power goes out, 
        - the server crashes, 
        - or the hard drive is pulled out and put back in, 
        - your data will still be there.

    - The Analogy: 
        - Imagine writing a note in pencil versus carving it into stone.
        1. Without Durability: 
            - Your data is in the computer's RAM (volatile memory). 
            - If the power blinks, the pencil marks are erased.
        2. With Durability: 
            - The database "carves" the transaction 
            - into the hard drive (non-volatile storage). 
            - Once it's carved, it's permanent.

2. How the Database does it (The Secret Log)
    - Writing to a massive database file is slow. 
        - To be "Durable" without being "Slow," 
        - databases use something called 
        - a Write-Ahead Log (WAL) or a Redo Log.
    1. When you click COMMIT, 
        - the database doesn't immediately go to the giant 500GB table file.
    2. Instead, it quickly writes the change 
        - to a small, very fast log file on the disk.
    3. It says "Success!" to you (the Node.js app).
    4. If the server crashes 1 second later, 
        - the database looks at that log during restart 
        - and says: "Oh, I see Ahmed committed a transfer right before the crash. 
        - Let me finish writing that to the main table now."

3. Why this matters for Node.js Developers
    - As a developer, 
        - you need to know that Durability has a cost.
    1. If you tell the database to be "Extreme" about durability 
        - (forcing it to wait for the disk to spin for every single row), 
        - your INSERT speed will drop.
    2. In some databases (like Redis or MongoDB), 
        - you can actually turn off durability to get 10x more speed, 
        - but you risk losing data if the server crashes.

- ❌ For a Banking or E-commerce app, you NEVER turn off durability.
