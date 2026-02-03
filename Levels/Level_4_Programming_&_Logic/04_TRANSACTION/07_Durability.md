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


