```SQL
/*
+-----------------------------------------------------------------------+
| Database Failure Modes & ACID Solutions                               |
+-----------------+-----------------------------------------------------+
| Failure Type    | Description              | The ACID Solution        |
+-----------------+-----------------------------------------------------+
| System Crash    | Power loss or OS         | Durability: Redo         |
|                 | freeze while writing.    | logs replay the changes. |
+-----------------+-----------------------------------------------------+
| Partial Success | Only part of a           | Atomicity: The whole     |
|                 | multi-query process runs.| thing Rolls Back.        |
+-----------------+-----------------------------------------------------+
| Data Corruption | Invalid data types       | Consistency: Constraints |
|                 | or duplicate emails.     | reject the write.        |
+-----------------+-----------------------------------------------------+
| Conflict        | Two users edit the       | Isolation: Locking       |
|                 | same row simultaneously. | forces them to wait.     |
+-----------------+-----------------------------------------------------+
*/
```

2. Node.js Specific Failures
    - Network Timeout      : The app thinks the query failed, but the DB actually saved it.
    - Connection Exhaustion: Too many users, no available connections. (Fix: Connection Pooling).
    - Unhandled Exceptions : Node.js crashes before it can send the COMMIT command.

3. The "Recovery" Hierarchy
    - Instant: Automatic Rollback (Atomicity).
    - Minutes: Replaying Logs (Durability).
    - Hours  : Restoring from Backups (Administration).

