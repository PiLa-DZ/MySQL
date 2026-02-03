# Data Replication
- Definition
    - Copying data from one database server to another to ensure redundancy and performance.
- Main Types
    1. Primary-Replica: One writer, many readers.
    2. Multi-Primary  : Multiple servers can write (very complex to manage).
- Benefits for Node.js Apps
    1. Read/Write Splitting : You can configure your Node.js `mysql2` pool to send all `SELECT` queries to the Replica and `INSERT` queries to the Primary.
    2. Zero-Downtime Backups: You can take a backup of a Replica without slowing down the main app.

### The "Lag" Warning
Always remember **Replication Lag**. If a user updates their profile and immediately refreshes the page, they might see the OLD data if the Replica hasn't finished copying yet!

1. The Core Concept: Master & Slaves
    - The most common way to do this is called Primary-Replica (formerly Master-Slave) replication.
    1. The Primary (Master): This server is the only one allowed to handle Writes (INSERT, UPDATE, DELETE).
    2. The Replicas (Slaves): These servers copy everything the Primary does. They are used for Reads (SELECT).

2. Why do we do this? (The 3 Pillars)
    1. High Availability (The "Safety" Pillar)
        - If your Primary server dies, you can "promote" one of your Replicas to be the new Primary. Your app stays online.
    2. Scalability (The "Speed" Pillar)
        - If you have 1 million users trying to SELECT their profile at once, one server will crash. With replication, you can spread those 1 million "Reads" across 10 different Replica servers.
    3. Geographic Locality (The "Proximity" Pillar)
        - You can put one Replica in the US, one in Europe, and one in Algeria. Users will get their data much faster because the physical distance is shorter.

3. How it works: The Binary Log (Again!)
    - Remember when we talked about Durability and Binlogs? Replication uses that exact same log.
    1. The Primary records a change in its binlog.
    2. The Replica "subscribes" to that log.
    3. The Replica reads the log and repeats the exact same SQL commands on its own copy of the data.

4. Asynchronous vs. Synchronous
    - This is a key concept for Backend Developers:
    1. Asynchronous (Standard): The Primary saves the data and tells the user "Success!" immediately. It sends the data to the Replicas a few milliseconds later. (Fast, but a Replica might be 1 second behind the real data).
    2. Synchronous: The Primary waits until all Replicas confirm they saved the data before telling the user "Success!". (Extremely safe, but much slower).
