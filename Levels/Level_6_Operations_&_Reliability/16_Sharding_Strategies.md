# Database Sharding

### Definition
A type of horizontal partitioning that splits large datasets across multiple independent database instances.

### Why Shard?
* When the database size exceeds the storage of a single server.
* When the write volume (TPS) is too high for one Master server.

### Strategies
* **Hash Sharding:** Mathematical distribution.
* **Range Sharding:** Distribution by category/geography.
* **Directory Sharding:** Distribution by a lookup service.

### Complexity Checklist
* [ ] How will I handle Joins? (Answer: Do it in Node.js).
* [ ] How will I handle Global Unique IDs? (Answer: Use UUIDs, not Auto-increment).
* [ ] What is my Shard Key? (The column used to decide the shard).

1. The Core Concept: Horizontal Partitioning
    - Sharding is a "Share-Nothing" architecture. You split your data across multiple independent databases (called Shards).
    - Each shard has the exact same table structure, but different rows.
        1. Shard A: Users with IDs 1 to 1,000,000.
        2. Shard B: Users with IDs 1,000,001 to 2,000,000.

2. Common Sharding Strategies
    1. Key-Based (Hash) Sharding
        - You take a value (like user_id), put it through a math formula (a Hash), and the result tells you which shard the data belongs to.
        1. Example: user_id % 3. If the remainder is 0, go to Shard 1. If 1, go to Shard 2.
        2. Pro: Distributes data very evenly.
        3. Con: Adding a new shard later is a nightmare because all the math changes.
    2. Range-Based Sharding
        - You split data based on ranges of a value.
        1. Example: Customers from Algeria go to Shard 1, Customers from France go to Shard 2.
        2. Pro: Easy to understand and implement.
        3. Con: Can lead to "Hot Spots." (If you have 1 million users in Algeria but only 10 in France, Shard 1 will be overloaded while Shard 2 is sleeping).
    3. Directory-Based Sharding
        - You maintain a "Lookup Table" that tracks where everything is.
        1. Example: You check a central table to see that "Ahmed" is stored in Shard C.
        2. Pro: Very flexible; you can move data around easily.
        3. Con: The lookup table itself can become a bottleneck.

3. The "Pain" of Sharding (Why we avoid it until necessary)
    - Sharding is the "Final Boss" of database scaling. It makes your life as a Node.js developer much harder:
    1. No Joins across Shards: You cannot easily JOIN a users table on Shard A with an orders table on Shard B. You have to do the joining in your Node.js code.
    2. Transaction Issues: Maintaining ACID (Atomic) transactions across two different servers is extremely complex and slow.
    3. Data Rebalancing: If one shard gets too full, moving data to a new shard is a massive engineering task.
