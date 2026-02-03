# The CAP Theorem --> The CAP Theorem is the "Law of Physics" for distributed databases.
ACID: Rules for a single database.
CAP: Rules for distributed (multiple) databases.

### Definition
In a distributed data store, it is impossible to simultaneously provide more than two out of the following three guarantees: Consistency, Availability, and Partition Tolerance.

### The Trade-offs
1. **CA (Rare):** Consistency + Availability. Only possible if the network never fails (Single server).
2. **CP:** Data is always correct, but the system might go offline during a network crash.
3. **AP:** System is always online, but users might see slightly different data temporarily.

### Node.js Tip
Always check if your DB library handles "Eventual Consistency." If you write to an AP database and immediately read it back, you might get the old value!
